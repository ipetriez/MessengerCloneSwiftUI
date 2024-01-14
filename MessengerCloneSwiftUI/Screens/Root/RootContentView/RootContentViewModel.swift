//
//  RootContentViewModel.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 14.01.24.
//

import Firebase

final class RootContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    init(userSession: FirebaseAuth.User? = nil) {
        self.userSession = userSession ?? AuthService().userSession
    }
}
