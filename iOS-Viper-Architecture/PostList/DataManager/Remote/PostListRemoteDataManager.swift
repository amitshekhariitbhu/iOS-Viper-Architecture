//
//  PostListRemoteDataManager.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import Foundation

class PostListRemoteDataManager:PostListRemoteDataManagerInputProtocol {
    
    func retrievePostList() throws -> [PostModel]  {
        var posts = [PostModel]()
        posts.append(PostModel())
        posts.append(PostModel())
        posts.append(PostModel())
        posts.append(PostModel())
        posts.append(PostModel())
        return posts
    }
    
}
