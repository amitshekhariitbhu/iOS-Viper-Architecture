//
//  PostDetailProtocols.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

protocol PostDetailViewProtocol: class {
    var presenter: PostDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showPostDetail(forPost post: PostModel)
}

protocol PostDetailWireFrameProtocol: class {
    static func createPostDetailModule(forPost post: PostModel) -> UIViewController
}

protocol PostDetailPresenterProtocol: class {
    var view: PostDetailViewProtocol? { get set }
    var wireFrame: PostDetailWireFrameProtocol? { get set }
    var post: PostModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
