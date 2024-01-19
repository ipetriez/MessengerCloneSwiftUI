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
    @StateObject private var inboxVM = InboxViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ActiveNowView()
                List {
                    ForEach(inboxVM.recentMessages) { message in
                        ChatsItemView(message: message)
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
                self.selectedUser = nil
            }))
        }
    }
}

#Preview {
    InboxView()
}
