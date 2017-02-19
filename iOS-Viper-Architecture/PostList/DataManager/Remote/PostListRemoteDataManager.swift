//
//  PostListRemoteDataManager.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PostListRemoteDataManager:PostListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol?
    
    func retrievePostList() {
        Alamofire
            .request(Endpoints.Posts.fetch.url, method: .get)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[PostModel]>) in
                switch response.result {
                case .success(let posts):
                    self.remoteRequestHandler?.onPostsRetrieved(posts)
            
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
}
