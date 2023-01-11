//
//  HomeViewController.swift
//  MVVM-Clean
//
//  Created by Ahmed Fathy on 10/01/2023.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel: HomeViewModelProtocol
    private var dataSources: PostsDataSources?
    private var anyCancellable = Set< AnyCancellable > ()
    
    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        viewModel.viewDidLoad()
        bindTOPostsDatasource()
    }
    
    func registerCell(){
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
    }
    
    func bindTOPostsDatasource(){
        viewModel.output
            .$posts
            .sink { [unowned self] posts in
                let postsSectionViewModel = PostsSectionViewModel(posts)
                self.dataSources = .init(postsSectionViewModel)
                self.tableView.delegate = dataSources
                self.tableView.dataSource = dataSources
                self.tableView.reloadData()
            }.store(in: &anyCancellable)
    }
}

// ViewController instance from ViewModel
// ViewModel instance from Usecase
// useCase instance from repository
// repostitory instance from remote&Local Data
