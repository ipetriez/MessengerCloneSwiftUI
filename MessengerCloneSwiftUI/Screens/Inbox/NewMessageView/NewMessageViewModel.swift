//
//  NewMessageViewModel.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 15.01.24.
//

import Foundation
import Firebase

@MainActor
final class NewMessageViewModel: ObservableObject {
    
    // MARK: — Publishers
    
    @Published var users = [User]()
    
    // MARK: — Lifecycle
    
    init() {
        Task { try await getAllUsers() }
    }
    
    func getAllUsers() async throws {
        users = try await UserService.getAllUsers().filter { $0.id != Auth.auth().currentUser?.uid }
    }
}
