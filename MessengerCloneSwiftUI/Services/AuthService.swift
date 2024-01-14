//
//  AuthService.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 13.01.24.
//

import Foundation
import Firebase

final class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    init(userSession: FirebaseAuth.User? = nil) {
        self.userSession = userSession ?? Auth.auth().currentUser
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
        } catch let error {
            print("DEGUG: Failed to create user with the following error: \(error)")
        }
    }
    
    func login(with email: String, password: String) async throws {
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        } catch {
            print("DEBUG: Failed to sign out with error: \(error)")
        }
    }
}
