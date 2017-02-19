//
//  PostDetailWireFrame.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

class PostDetailWireFrame: PostDetailWireFrameProtocol {
    
    class func createPostDetailModule(forPost post: PostModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "PostDetailController")
        if let view = viewController as? PostDetailView {
            let presenter: PostDetailPresenterProtocol = PostDetailPresenter()
            let wireFrame: PostDetailWireFrameProtocol = PostDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.post = post
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}


