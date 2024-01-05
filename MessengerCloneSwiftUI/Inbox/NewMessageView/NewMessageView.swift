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
                
                ForEach(0 ... 10, id: \.self) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: User.mockUser, size: .small)
                            
                            Text("Bruce Wallets")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        Divider()
                            .padding(.leading, 40)
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
        NewMessageView()
    }
}
