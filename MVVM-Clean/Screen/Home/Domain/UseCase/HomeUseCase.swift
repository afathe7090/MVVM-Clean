//
//  HomeUseCase.swift
//  MVVM-Clean
//
//  Created by Ahmed Fathy on 10/01/2023.
//

import Foundation
import Combine

class HomeUseCase {
    private let repo: HomeRepoProtocol
    init(repo: HomeRepoProtocol = HomeRepoImple()) {
        self.repo = repo
    }
    
    func getPosts()-> AnyPublisher< Posts , Error > {
        return repo.getPosts()
    }

}
