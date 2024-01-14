//
//  AuthService.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 13.01.24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

final class AuthService {
    
    // MARK: — Public properties
    
    @Published var userSession: FirebaseAuth.User?
    
    // MARK: — Singleton
    
    static let shared = AuthService()
    
    // MARK: — Lifecycle
    
    init(userSession: FirebaseAuth.User? = nil) {
        self.userSession = userSession ?? Auth.auth().currentUser
    }
    
    // MARK: — Public methods
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullName: fullName, id: result.user.uid)
        } catch let error {
            print("DEGUG: Failed to create user with the following error: \(error)")
        }
    }
    
    func login(with email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to sign in with error: \(error)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        } catch {
            print("DEBUG: Failed to sign out with error: \(error)")
        }
    }
    
    // MARK: — Private methods
    
    private func uploadUserData(email: String, fullName: String, id: String) async throws {
        let user = User(fullName: fullName, email: email, profileImageURL: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
}
