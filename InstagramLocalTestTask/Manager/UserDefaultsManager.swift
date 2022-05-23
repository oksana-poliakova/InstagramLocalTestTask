//
//  UserdefaultsManager.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 23.05.2022.
//

import Foundation

// SINGLETONE

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() { }
    
    func setUsername(_ name: String)  {
        UserDefaults.standard.set(name, forKey: "username")
    }
    
    var username: String {
        UserDefaults.standard.value(forKey: "username") as? String ?? ""
    }
}
