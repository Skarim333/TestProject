//
//  DatabaseManager.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import Foundation

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    enum SettingKeys: String {
        case users
        case activeUser
    }
    
    private let defaults = UserDefaults.standard
    private let userKey = SettingKeys.users.rawValue
    
    init() {
        if !userExists(firstName: "root", password: "root") {
            saveUser(firstName: "root", lastName: "", email: "", password: "root")
        }
    }
    
    var users: [User] {
        get {
            guard let data = defaults.value(forKey: userKey) as? Data else {
                return []
            }
            
            do {
                let users = try PropertyListDecoder().decode([User].self, from: data)
                return users
            } catch {
                print("Error decoding users data: \(error)")
                return []
            }
        }
        set {
            do {
                let data = try PropertyListEncoder().encode(newValue)
                defaults.set(data, forKey: userKey)
            } catch {
                print("Error encoding users data: \(error)")
            }
        }
    }
    
    func saveUser(firstName: String, lastName: String, email: String, password: String) {
        let user = User(firstName: firstName, lastName: lastName, email: email, password: password)
        users.insert(user, at: 0)
    }
    
    func deleteUser() {
        users.removeAll()
    }
    
    func userExists(firstName: String, password: String) -> Bool {
            return users.contains { $0.firstName == firstName && $0.password == password }
        }
    
}

