//
//  HomeViewModel.swift
//  MVVM-Clean
//
//  Created by Ahmed Fathy on 10/01/2023.
//

import Foundation
import Combine

protocol ViewModel: AnyObject {
    associatedtype Input
    associatedtype Output
}

protocol HomeViewModelProtocol: AnyObject {
    var input: HomeViewModel.Input { get }
    var output: HomeViewModel.Output { get }
    func viewDidLoad()
}

final class HomeViewModel: ObservableObject, HomeViewModelProtocol ,ViewModel{
    
    class Input{
    }
    
    class Output{
        @Published var posts: Posts = []
    }
    
    var input: Input  = .init()
    var output: Output = .init()
    
    let useCase: HomeUseCase
    private var anyCancellable = Set< AnyCancellable > ()
    init( useCase: HomeUseCase = HomeUseCase()) {
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        callPosts()
    }
    
    func callPosts(){
        useCase.getPosts().receive(on: DispatchQueue.main)
            .sink { finish in
                print(finish)
            } receiveValue: { [unowned self]  posts in
                self.output.posts = posts
            }.store(in: &anyCancellable)
    }
    
    
}
