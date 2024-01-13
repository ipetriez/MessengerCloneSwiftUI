//
//  LoginViewModel.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 13.01.24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService().login(with: email, password: password)
    }
}
