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
            List {
                ActiveNowView()
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                
                ForEach(inboxVM.recentMessages) { message in
                    ZStack {
                        NavigationLink(value: message) {
                            EmptyView()
                        }.opacity(0)
                        ChatsItemView(message: message)
                    }
                }
            }
            .listStyle(.plain)
            .onChange(of: selectedUser, { oldValue, newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: TextMessage.self, destination: { message in
                if let user = message.user {
                    ChatView(user: user)
                }
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
