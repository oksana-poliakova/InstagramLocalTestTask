//
//  CoreDataManager.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 10.05.2022.
//

import UIKit
import CoreData

class CoreDataManager {
    static var shared = CoreDataManager()
    
    private let context: NSManagedObjectContext = {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType) }
        return context
    }()
    
    public func getUser() -> User? {
        let user = try? context.fetch(User.fetchRequest())
        return user?.first
    }
    
    public func getUsers() -> [User] {
        guard let users = try? context.fetch(User.fetchRequest()) else { return [] }
        
        return users
    }
}
