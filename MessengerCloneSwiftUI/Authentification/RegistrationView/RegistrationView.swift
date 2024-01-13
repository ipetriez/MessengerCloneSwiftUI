//
//  RegistrationView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 02.01.24.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var registrationVM = RegistrationViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $registrationVM.email)
                    .modifier(AuthFieldModifier())
                TextField("Enter your full name", text: $registrationVM.fullName)
                    .modifier(AuthFieldModifier())
                SecureField("Enter your password", text: $registrationVM.password)
                    .modifier(AuthFieldModifier())
            }
            
            Button("Sign Up") {
                Task { try await registrationVM.createUser() }
            }
            .modifier(AuthActionButtonModifier())
            
            Spacer()
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    RegistrationView()
}
