//
//  CoreDataManager.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 10.05.2022.
//

import UIKit
import CoreData

final class CoreDataManager {
    // MARK: - Properties
    
    static let shared = CoreDataManager()
    
    private let context: NSManagedObjectContext = {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType) }
        return context
    }()
    
    private init() { }
    
    // MARK: - Create User
    
    public func createUser(email: String, fullname: String, password: String, username: String, avatar: Data) {
        context.perform {
            do {
                let user = User(context: self.context)
                user.username = username
                user.avatar = avatar
                user.email = email
                user.password = password
                user.fullname = fullname
                
                try? self.context.save()
            }
        }
    }
    
    // MARK: - Update User
    
    public func updateUser(user: User, email: String, fullname: String, password: String, username: String, avatar: Data) {
        context.perform {
            do {
                user.username = username
                user.avatar = avatar
                user.email = email
                user.password = password
                user.fullname = fullname
                
                try? self.context.save()
            }
        }
    }
    
    // MARK: - Delete User
    
    public func deleteUser(user: User) {
        context.delete(user)
    }
    
    // MARK: - Read users
    
    public func getUser() -> User? {
        /// Use fetchRequest with Predicate to filter users by username(should be changed by id)
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@", UserDefaultsManager.shared.username)
        
        /// Here we use fetchResultController to receive fetched object(filtered by username) then getting our User
        let fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                 managedObjectContext: context,
                                                                 sectionNameKeyPath: nil,
                                                                 cacheName: nil)
        try? fetchedResultController.performFetch()
        
        guard let user = fetchedResultController.fetchedObjects?.first else {
            fatalError("Unfortunately can't fetch object")
        }
    
        return user
    }
    
    // MARK: - Read all users
    
    public func getUsers() -> [User] {
        /// Here we get all users to understand.
        /// What user has been registered
        guard let users = try? context.fetch(User.fetchRequest()) else { return [] }
        return users
    }
    
    // MARK: - Post create
    
    public func createPost(user: User, photo: Data, postDescription: String) {
        context.perform {
            do {
                let post = Post(context: self.context)
                post.user = user
                post.photo = photo
                post.postDescription = postDescription
                post.uuid = UUID()
                
                /// Inserting to user new post
                user.posts.insert(post)
                
                try? self.context.save()
            }
        }
    }
    
    // MARK: - Post update
    
    public func updatePost(post: Post, photo: Data, postDescription: String) {
        context.perform {
            do {
                post.photo = photo
                post.postDescription = postDescription
                try? self.context.save()
            }
        }
    }
}

