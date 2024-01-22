//
//  ActiveNowViewModel.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 22.01.24.
//

import Foundation
import Firebase

final class ActiveNowViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init(users: [User] = [User]()) {
        if users.count > 0 {
            self.users = users
        } else {
            Task { try await self.getUsers() }
        }
    }
    
    @MainActor
    private func getUsers() async throws {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        self.users = try await UserService.shared.getAllUsers(limit: 20).filter { $0.id != currentUserID }
    }
}
