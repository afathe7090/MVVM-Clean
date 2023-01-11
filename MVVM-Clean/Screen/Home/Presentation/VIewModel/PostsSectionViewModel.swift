//
//  PostsSectionViewModel.swift
//  MVVM-Clean
//
//  Created by Ahmed Fathy on 10/01/2023.
//

import Foundation

class PostsSectionViewModel{
    var dataSource: Posts
    init(_ dataSource: Posts) {
        self.dataSource = dataSource
    }
}
