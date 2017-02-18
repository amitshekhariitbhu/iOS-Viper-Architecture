//
//  PostModel.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import Foundation
import ObjectMapper

struct PostModel {
    var id = 0
    var title = ""
    var imageUrl = ""
    var thumbImageUrl = ""
}

extension PostModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id       <- map["id"]
        title     <- map["title"]
        imageUrl     <- map["url"]
        thumbImageUrl     <- map["thumbUrl"]
    }
    
}
