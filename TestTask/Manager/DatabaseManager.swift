//
//  DatabaseManager.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import Foundation

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let userDefaults = UserDefaults.standard
    
    private init() {
        if !userExists(firstName: "root", password: "root") {
            saveUser(firstName: "root", lastName: "", email: "", password: "root")
        }
    }
    enum SettingKeys: String {
            case users
            case activeUser
        }
    
    func saveUser(firstName: String, lastName: String, email: String, password: String) {
        var users = loadUsers()
        let user = User(firstName: firstName, lastName: lastName, email: email, password: password)
        users.append(user)
        saveUsers(users)
    }
    
    func findUserByFirstName(_ firstName: String) -> User? {
        let users = loadUsers()
        return users.first(where: { $0.firstName == firstName })
    }
    
    func loadUsers() -> [User] {
        guard let userJsonData = userDefaults.data(forKey: SettingKeys.users.rawValue) else {
            return []
        }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([User].self, from: userJsonData)
        } catch {
            print("Failed to decode user data: \(error.localizedDescription)")
            return []
        }
    }
    
    func saveUsers(_ users: [User]) {
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(users)
            userDefaults.set(jsonData, forKey: SettingKeys.users.rawValue)
        } catch {
            print("Failed to encode user data: \(error.localizedDescription)")
        }
    }
    
    func deleteAllUsers() {
        userDefaults.removeObject(forKey: SettingKeys.users.rawValue)
    }
    
    func userExists(firstName: String, password: String) -> Bool {
        let users = loadUsers()
        return users.contains { $0.firstName == firstName && $0.password == password }
    }
}
enum AuthError: Error {
case invalidInput
case userAlreadyExists
case userNotFound
case invalidCredentials
}
