//
//  InboxView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 04.01.24.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @State private var selectedUser: User?
    @State private var showChat = false
    @State private var inboxVM = InboxViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ActiveNowView()
                List {
                    ForEach(0 ... 10, id: \.self) { chat in
                        ChatsItemView()
                    }
                }
                .listStyle(.plain)
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .onChange(of: selectedUser, { oldValue, newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: $inboxVM.currentUser)
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .modifier(ChatsToolbarModifier(user: $inboxVM.currentUser, action: {
                showNewMessageView.toggle()
            }))
        }
    }
}

#Preview {
    InboxView()
}
