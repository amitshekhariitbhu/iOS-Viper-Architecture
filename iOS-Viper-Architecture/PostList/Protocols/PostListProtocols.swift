//
//  PostListProtocols.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

protocol PostListViewProtocol: class {
    var presenter: PostListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showPosts(with posts: [PostModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol PostListWireFrameProtocol: class {
    static func createPostListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentPostDetailScreen(from view: PostListViewProtocol, forPost post: PostModel)
}

protocol PostListPresenterProtocol: class {
    var view: PostListViewProtocol? { get set }
    var interactor: PostListInteractorInputProtocol? { get set }
    var wireFrame: PostListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showPostDetail(forPost post: PostModel)
}

protocol PostListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrievePosts(_ posts: [PostModel])
    func onError()
}

protocol PostListInteractorInputProtocol: class {
    var presenter: PostListInteractorOutputProtocol? { get set }
    var localDatamanager: PostListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PostListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrievePostList()
}

protocol PostListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol PostListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrievePostList()
}

protocol PostListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onPostsRetrieved(_ posts: [PostModel])
    func onError()
}

protocol PostListLocalDataManagerInputProtocol: class {
     // INTERACTOR -> LOCALDATAMANAGER
    func retrievePostList() throws -> [Post]
    func savePost(id: Int, title: String, imageUrl: String, thumbImageUrl: String) throws
}
