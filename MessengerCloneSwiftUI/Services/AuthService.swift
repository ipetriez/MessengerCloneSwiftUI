//
//  AuthService.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 13.01.24.
//

import Foundation
import Firebase

final class AuthService {
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Created user \(result.user.uid)")
        } catch let error {
            print("DEGUG: Failed to create user with the following error: \(error)")
        }
    }
    
    func login(with email: String, password: String) async throws {
        
    }
}
