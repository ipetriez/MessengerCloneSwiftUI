//
//  UserService.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 14.01.24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

final class UserService {
    
    // MARK: — Public properties
    
    @Published var currentUser: User?
    
    // MARK: — Singleton
    
    static let shared = UserService()
    
    private init() { }
    
    // MARK: — Public methods
    
    func getCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let users = Firestore.firestore().collection("users")
        let userDocSnapshot = try await users.document(uid).getDocument()
        let user = try userDocSnapshot.data(as: User.self)
        self.currentUser = user
    }
    
    static func getAllUsers() async throws -> [User] {
        let querySnapshot = try await Firestore.firestore().collection("users").getDocuments()
        return querySnapshot.documents.compactMap { try? $0.data(as: User.self) }
    }
}
