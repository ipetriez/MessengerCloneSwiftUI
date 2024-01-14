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
    
    // MARK: — Lifecycle
    
    init() {
        setupBindings()
    }
    
    // MARK: — Private methods
    
    private func setupBindings() {
        UserService.shared.$currentUser
            .compactMap { $0 }
            .sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &subscriptions)
    }
}
