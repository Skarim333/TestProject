//
//  UserManager.swift
//  TestTask
//
//  Created by Карим Садыков on 12.03.2023.
//

import UIKit
//
//class UserManager {
//    
//    private var users: [User] = []
//    
//    static let shared = UserManager()
//    
//    func createUser(firstName: String, lastName: String, email: String, password: String) -> Result<User, Error> {
//        // Validate input parameters
//        guard !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty else {
//            return .failure(AuthError.invalidInput)
//        }
//        
//        // Check if user with the same email already exists
//        if users.contains(where: { $0.email == email }) {
//            return .failure(AuthError.userAlreadyExists)
//        }
//        
//        // Create new user and add it to the list
//        let user = User(firstName: firstName, lastName: lastName, email: email, password: password)
//        users.append(user)
//        
//        return .success(user)
//    }
//    
//    func findUserByEmail(_ email: String) -> User? {
//        return users.first(where: { $0.email == email })
//    }
//}
//
//class AuthManagerb {
//    
//    static let shared = AuthManagerb()
//    
//    private init() {}
//    
//    func logIn(email: String, password: String) -> Result<String, Error> {
//        // Check if user with the given email exists
//        guard let user = UserManager.shared.findUserByEmail(email) else {
//            return .failure(AuthError.userNotFound)
//        }
//        
//        // Check if password is correct
//        guard user.password == password else {
//            return .failure(AuthError.invalidCredentials)
//        }
//        
//        // Generate authentication token
//        let token = UUID().uuidString
//        
//        // Store token and user email in the session manager
//        SessionManager.shared.startSession(token: token, email: email)
//        
//        return .success(token)
//    }
//    
//    func logOut() {
//        SessionManager.shared.endSession()
//    }
//    
//    var isLoggedIn: Bool {
//        return SessionManager.shared.currentSession != nil
//    }
//}
//
//class SessionManager {
//    
//    static let shared = SessionManager()
//    
//    private var sessions: [String: String] = [:] // token: email
//    
//    private init() {}
//    
//    var currentSession: String? {
//        return sessions.first(where: { $1 == currentUserEmail })?.key
//    }
//    
//    private var currentUserEmail: String? {
//        return UserDefaults.standard.string(forKey: "currentUserEmail")
//    }
//    
//    func startSession(token: String, email: String) {
//        sessions[token] = email
//        UserDefaults.standard.set(email, forKey: "currentUserEmail")
//    }
//    
//    func endSession() {
//        if let token = currentSession {
//            sessions.removeValue(forKey: token)
//        }
//        UserDefaults.standard.removeObject(forKey: "currentUserEmail")
//    }
//}
//
//enum AuthError: Error {
//case invalidInput
//case userAlreadyExists
//case userNotFound
//case invalidCredentials
//}
//
//
