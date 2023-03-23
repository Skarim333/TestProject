//
//  AuthManager.swift
//  TestTask
//
//  Created by Карим Садыков on 10.03.2023.
//

import UIKit
 
 final class AuthManager {
      public static let shared = AuthManager()
      private init() {}
     
      enum SignInMethod {
          case email
          case google
          case apple
      }
     
      enum AuthError: Error {
          case signInFailed
          case userNotFound
          case invalidCredentials
      }
     
      public var isSignedIn: Bool {
          return SessionManager.shared.currentUser != nil
      }
     
      public func logIn(firstName: String, password: String) -> Result<String, Error> {
          // Check if user with the given email exists
          guard let user = DatabaseManager.shared.findUserByFirstName(firstName) else {
              return .failure(AuthError.userNotFound)
          }
         
          // Check if password is correct
          guard user.password == password else {
              return .failure(AuthError.invalidCredentials)
          }
         
          // Generate authentication token
          let token = UUID().uuidString
         
          // Store token and user email in the session manager
          SessionManager.shared.startSession(token: token, firstName: firstName)
         
          return .success(token)
      }
     
     public func signIn(firstName: String, lastName: String, email: String, password: String) -> Result<String, Error>  {
          DatabaseManager.shared.saveUser(firstName: firstName, lastName: lastName, email: email, password: password)
         
         let token = UUID().uuidString
        
         // Store token and user email in the session manager
         SessionManager.shared.startSession(token: token, firstName: firstName)
        
         return .success(token)
      }
     
      public func signOut() {
          SessionManager.shared.endSession()
      }
 }
