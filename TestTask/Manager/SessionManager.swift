//
//  SessionManager.swift
//  TestTask
//
//  Created by Карим Садыков on 12.03.2023.
//

import UIKit

class SessionManager {
    static let shared = SessionManager()

    private let databaseManager = DatabaseManager.shared

    private var sessions: [String: String] = [:] // token: email

    private init() {}

    var currentUser: User? {
        guard let firstName = currentUserFirstName else { return nil }
        return databaseManager.findUserByFirstName(firstName)
    }

    private var currentUserFirstName: String? {
        return UserDefaults.standard.string(forKey: "currentUserFirstName")
    }

    var currentSession: String? {
        return sessions.first(where: { $1 == currentUserFirstName })?.key
    }

    func startSession(token: String, firstName: String) {
        sessions[token] = firstName
        UserDefaults.standard.set(firstName, forKey: "currentUserFirstName")
    }

    func endSession() {
        if let token = currentSession {
            sessions.removeValue(forKey: token)
        }
        UserDefaults.standard.removeObject(forKey: "currentUserFirstName")
    }
}
