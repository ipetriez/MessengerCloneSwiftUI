//
//  RegistrationViewModel.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 13.01.24.
//

import Foundation

final class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName)
    }
}
