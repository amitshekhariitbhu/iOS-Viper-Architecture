//
//  PostTableViewCell.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 19/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit
import AlamofireImage

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(forPost post: PostModel) {
        self.selectionStyle = .none
        titleLabel?.text = post.title
        let url = URL(string: post.thumbImageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        postImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
