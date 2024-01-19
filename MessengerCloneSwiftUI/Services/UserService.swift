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
    
    // MARK: — Private properties
    
    private let usersCollection = Firestore.firestore().collection("users")
    
    // MARK: — Public properties
    
    @Published var currentUser: User?
    
    // MARK: — Singleton
    
    static let shared = UserService()
    
    private init() { }
    
    // MARK: — Public methods
    
    func getCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userDocSnapshot = try await usersCollection.document(uid).getDocument()
        let user = try userDocSnapshot.data(as: User.self)
        self.currentUser = user
    }
    
    func getAllUsers() async throws -> [User] {
        let querySnapshot = try await usersCollection.getDocuments()
        return querySnapshot.documents.compactMap { try? $0.data(as: User.self) }
    }
    
    func getUser(with uid: String, completion: @escaping (User) -> Void) {
        usersCollection.document(uid).getDocument { snapshot, error in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
}
