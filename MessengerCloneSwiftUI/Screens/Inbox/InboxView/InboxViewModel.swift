//
//  InboxViewModel.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 14.01.24.
//

import Foundation
import Combine
import Firebase

final class InboxViewModel: ObservableObject {
    
    // MARK: — Private properties
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: — Publishers
    
    @Published var currentUser: User?
    @Published var recentMessages = [TextMessage]()
    
    // MARK: — Lifecycle
    
    init() {
        setupBindings()
        InboxService.shared.observeRecentMessages()
    }
    
    // MARK: — Private methods
    
    private func setupBindings() {
        UserService.shared.$currentUser
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &subscriptions)
        
        InboxService.shared.$documentChanges.sink { [weak self] changes in
            self?.loadInitialMessages(from: changes)
        }.store(in: &subscriptions)
    }
    
    private func loadInitialMessages(from changes: [DocumentChange]) {
        let messages = changes.compactMap { try? $0.document.data(as: TextMessage.self) }
        
        messages.enumerated().forEach { index, message in
            UserService.shared.getUser(with: message.chatPartnerID) { user in
                var recentMessage = message
                recentMessage.user = user
                self.recentMessages.append(recentMessage)
            }
        }
    }
}
