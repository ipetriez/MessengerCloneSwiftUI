//
//  RegistrationView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 02.01.24.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    var body: some View {
        VStack {
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 150, height: 150)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .modifier(AuthFieldModifier())
                TextField("Enter your full name", text: $fullName)
                    .modifier(AuthFieldModifier())
                TextField("Enter your password", text: $password)
                    .modifier(AuthFieldModifier())
            }
            
            Button("Sign Up") {
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 360, height: 44)
            .background(Color(.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.vertical)
            
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
