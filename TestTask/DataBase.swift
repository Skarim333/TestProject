//
//  DataBase.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import Foundation

class DataBase {
    
    static let  shared = DataBase()
    
    enum SettingKeys: String {
        case users
        case activeUser
    }
    
    let defaults = UserDefaults.standard
    let userKey = SettingKeys.users.rawValue
    
    var users: [User] {
        get {
            if let data = defaults.value(forKey: userKey) as? Data{
                return try! PropertyListDecoder().decode([User].self, from: data)
            } else {
                return [User]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue){
                defaults.set(data, forKey: userKey)
            }
        }
    }
    
    func saveUser(firstName: String, lastName: String, email: String, password: String)  {
        

        let user = User(firstName: firstName, lastName: lastName, email: email, password: password)
        users.insert(user, at: 0)
    }
    
    func deleteUser() {
        users.removeAll()
    }
}
