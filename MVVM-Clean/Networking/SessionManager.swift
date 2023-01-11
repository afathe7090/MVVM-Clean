//
//  SessionManager.swift
//  MVVM-Clean
//
//  Created by Ahmed Fathy on 10/01/2023.
//

import Foundation
import Combine

public final class Session {
    
    private var anyCancellable = Set<AnyCancellable>()
    public static var instance = Session()
    
    public func request<T: Codable>(from urlStr: String ,_ model: T.Type) -> AnyPublisher<T, Error>{
        let url = URL(string: urlStr)!
        let decoder = JSONDecoder()

        return Future { [unowned self] promise in
           URLSession.shared.dataTaskPublisher(for: url)
               .retry(1)
               .mapError({$0})
               .tryMap { dataElement -> Data in
                   guard let httpResponse = dataElement.response as? HTTPURLResponse ,
                         httpResponse.statusCode == 200 else {
                       throw URLError(.badServerResponse)
                   }
                   return dataElement.data
               }
               .decode(type: model.self, decoder: decoder)
               .receive(on: DispatchQueue.main)
               .sink { finished in
                   print(finished)
               } receiveValue: { data in
                   promise(.success(data))
               }.store(in: &anyCancellable)
        }.eraseToAnyPublisher()
        
    }
}

