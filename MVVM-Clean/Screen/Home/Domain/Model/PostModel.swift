//
//  HomeModel.swift
//  MVVM-Clean
//
//  Created by Ahmed Fathy on 10/01/2023.
//

import Foundation

struct PostModel: Codable {
    let title: String
    let body: String
}
typealias Posts = [PostModel]
