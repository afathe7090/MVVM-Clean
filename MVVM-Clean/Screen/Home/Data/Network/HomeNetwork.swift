//
//  HomeNetwork.swift
//  MVVM-Clean
//
//  Created by Ahmed Fathy on 10/01/2023.
//

import Foundation
import Combine

protocol HomeRemoteRepository {
    func getPosts() -> AnyPublisher< Posts , Error >
}

class HomeNetwork: HomeRemoteRepository {
    func getPosts() -> AnyPublisher< Posts , Error > {
        let url = "https://jsonplaceholder.typicode.com/posts"
        let posts =  Session.instance.request(from: url, Posts.self)
        return posts
    }
}
