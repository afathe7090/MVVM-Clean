//
//  HomeRepoImple.swift
//  MVVM-Clean
//
//  Created by Ahmed Fathy on 10/01/2023.
//

import Foundation
import Combine

// Network -- Local == HomeRepo --> UseCase

final class HomeRepoImple: HomeRepoProtocol{
    let homeNetwork: HomeRemoteRepository
    init(homeNetwork: HomeRemoteRepository = HomeNetwork()) {
        self.homeNetwork = homeNetwork
    }
    
    func getPosts() -> AnyPublisher<Posts, Error> {
        homeNetwork.getPosts()
    }
}
