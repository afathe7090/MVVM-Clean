//
//  PostsDataSources.swift
//  MVVM-Clean
//
//  Created by Ahmed Fathy on 10/01/2023.
//

import UIKit

class PostsDataSources: NSObject , UITableViewDelegate , UITableViewDataSource {
    private var postViewModel: PostsSectionViewModel
    
    init(_ postViewModel: PostsSectionViewModel){
        self.postViewModel = postViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.lblBody.text = postViewModel.dataSource[indexPath.item].body
        cell.lblTitle.text = postViewModel.dataSource[indexPath.item].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
