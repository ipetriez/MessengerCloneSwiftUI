//
//  RootContentViewModel.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 14.01.24.
//

import Firebase
import Combine

final class RootContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var subscriptions = Set<AnyCancellable>()
    
    init(userSession: FirebaseAuth.User? = nil) {
        if let session = userSession {
            self.userSession = session
        } else {
            AuthService.shared.$userSession
                .receive(on: DispatchQueue.main)
                .sink { [weak self] user in
                self?.userSession = user
            }.store(in: &subscriptions)
        }
    }
}
