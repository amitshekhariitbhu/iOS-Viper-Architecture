//
//  PostListView.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

class PostListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: PostListPresenterProtocol?
    var postList: [PostModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func didClickOnAddButton(_ sender: UIBarButtonItem) {
        presenter?.showPostDetail(from: self)
    }
    
}

extension PostListView: PostListViewProtocol {
    
    func showPosts(with posts: [PostModel]) {
        postList = posts
        tableView.reloadData()
    }
    
}

extension PostListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") else {
            return UITableViewCell()
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
}
