//
//  PostListInteractor.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

class PostListInteractor: PostListInteractorInputProtocol {
    weak var presenter: PostListInteractorOutputProtocol?
    var localDatamanager: PostListLocalDataManagerInputProtocol?
    var remoteDatamanager: PostListRemoteDataManagerInputProtocol?
    
    func retrievePostList() {
        do {
            if let contactList = try localDatamanager?.retrievePostList() {
                presenter?.didRetrievePosts(contactList)
            } else {
                presenter?.didRetrievePosts([])
            }
        } catch {
            presenter?.didRetrievePosts([])
        }
    }
    
}
