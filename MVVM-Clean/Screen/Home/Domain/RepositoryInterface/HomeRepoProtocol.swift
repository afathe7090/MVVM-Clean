//
//  HomeRepoProtocol.swift
//  MVVM-Clean
//
//  Created by Ahmed Fathy on 10/01/2023.
//

import Foundation
import Combine

protocol HomeRepoProtocol{
    func getPosts() -> AnyPublisher< Posts , Error >
}
