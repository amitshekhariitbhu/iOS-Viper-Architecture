//
//  PostDetailView.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

class PostDetailView: UIViewController {
    
    var presenter: PostDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension PostDetailView: PostDetailViewProtocol {
    
    func showPostDetail(forPost posts: PostModel) {
        
    }
    
}
