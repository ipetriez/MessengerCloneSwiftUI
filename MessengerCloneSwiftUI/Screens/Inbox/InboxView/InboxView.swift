//
//  InboxView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 04.01.24.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
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
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: $inboxVM.currentUser)
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView()
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
