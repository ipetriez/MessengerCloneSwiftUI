//
//  ContentView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 02.01.24.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
                
                VStack {
                    TextField("Enter your email", text: $email)
                        .modifier(AuthFieldModifier())
                    TextField("Enter your password", text: $password)
                        .modifier(AuthFieldModifier())
                }
                
                Button("Forgot your Password?") {
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.trailing, 28)
                
                Button("Log in") {
                    
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 360, height: 44)
                .background(Color(.systemBlue))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundStyle(.gray)
                
                HStack {
                    Image("Facebook-Logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                }
                .padding(.top, 8)
                
                Spacer()
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LogInView()
}
