//
//  Post+CoreDataProperties.swift
//  
//
//  Created by Amit Shekhar on 19/02/17.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post");
    }

    @NSManaged public var thumbImageUrl: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var title: String?
    @NSManaged public var id: Int32

}
