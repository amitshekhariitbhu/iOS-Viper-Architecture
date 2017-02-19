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
            if let postList = try localDatamanager?.retrievePostList() {
                let postModelList = postList.map() {
                    return PostModel(id: Int($0.id), title: $0.title!, imageUrl: $0.imageUrl!, thumbImageUrl: $0.thumbImageUrl!)
                }
                if  postModelList.isEmpty {
                    remoteDatamanager?.retrievePostList()
                }else{
                   presenter?.didRetrievePosts(postModelList)
                }
            } else {
                remoteDatamanager?.retrievePostList()
            }
            
        } catch {
            presenter?.didRetrievePosts([])
        }
    }
        
}

extension PostListInteractor: PostListRemoteDataManagerOutputProtocol {
    
    func onPostsRetrieved(_ posts: [PostModel]) {
        presenter?.didRetrievePosts(posts)
        
        for postModel in posts {
            do {
                try localDatamanager?.savePost(id: postModel.id, title: postModel.title, imageUrl: postModel.imageUrl, thumbImageUrl: postModel.thumbImageUrl)
            } catch  {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
