//
//  User.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 10.05.2022.
//

import Foundation
import CoreData

@objc(User)
final class User: NSManagedObject {
    @NSManaged public var email: String
    @NSManaged public var fullname: String
    @NSManaged public var password: String
    @NSManaged public var username: String
    @NSManaged public var avatar: Data
    @NSManaged public var posts: Set<Post>
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
}
