//
//  ChatView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 05.01.24.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var chatVM: ChatViewModel
    let user: User
    
    init(user: User) {
        self._chatVM = StateObject(wrappedValue: ChatViewModel(user: user))
        self.user = user
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CircularProfileImageView(user: .constant(user), size: .xLarge)
                    
                    VStack(spacing: 4) {
                        Text(user.fullName)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messanger")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                }
                
                LazyVStack {
                    ForEach(chatVM.messages) { message in
                        ChatMessageView(messageType: message.isFromCurrentUser ? .incoming : .outcoming, message: message)
                    }
                }
            }
            
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $chatVM.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(.capsule)
                    .font(.subheadline)
                
                Button("Send") {
                    chatVM.sendMessage()
                }
                .fontWeight(.semibold)
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    ChatView(user: User.mockData)
}
