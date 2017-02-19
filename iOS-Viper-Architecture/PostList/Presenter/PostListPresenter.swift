//
//  PostListPresenter.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

class PostListPresenter: PostListPresenterProtocol {
    weak var view: PostListViewProtocol?
    var interactor: PostListInteractorInputProtocol?
    var wireFrame: PostListWireFrameProtocol?
    
    func viewDidLoad() {
        interactor?.retrievePostList()
    }
    
    func showPostDetail(forPost post: PostModel) {
        wireFrame?.presentPostDetailScreen(from: view!, forPost: post)
    }
    
}

extension PostListPresenter: PostListInteractorOutputProtocol {
    
    func didRetrievePosts(_ posts: [PostModel]) {
        view?.showPosts(with: posts)
    }
    
    func onError() {
    
    }
    
}


