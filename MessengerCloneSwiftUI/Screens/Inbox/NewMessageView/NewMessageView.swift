//
//  NewMessageView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 04.01.24.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @Binding var selectedUser: User?
    @StateObject private var vm = NewMessageViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To: ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("CONTACTS")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
                
                ForEach(vm.users) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: .constant(user), size: .small)
                            
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        Divider()
                            .padding(.leading, 40)
                    }
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewMessageView(selectedUser: .constant(User(fullName: "Jim", email: "jim@mock.com", profileImageURL: nil)))
    }
}
