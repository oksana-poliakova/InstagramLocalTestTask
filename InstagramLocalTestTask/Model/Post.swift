//
//  Post.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 10.05.2022.
//

import Foundation
import CoreData

@objc(Post)
final class Post: NSManagedObject {
    @NSManaged public var photo: Data
    @NSManaged public var postDescription: String
    @NSManaged public var user: User
}
