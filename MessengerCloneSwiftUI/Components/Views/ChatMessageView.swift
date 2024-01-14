//
//  ChatMessageBubble.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 09.01.24.
//

import SwiftUI

struct ChatMessageView: View {
    enum MessageType {
        case incoming, outcoming
    }
    
    let messageType: MessageType
    
    var body: some View {
        HStack {
            switch messageType {
            case .incoming:
                HStack(alignment: .bottom, spacing: 8) {
                    CircularProfileImageView(user: .constant(.mockData), size: .xxSmall)
                    Text("This is a test message")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundStyle(.black)
                        .clipShape(ChatBubble(messageType: messageType))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                    Spacer()
                }
            case .outcoming:
                Spacer()
                Text("This is a test message")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundStyle(.white)
                    .clipShape(ChatBubble(messageType: messageType))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ChatMessageView(messageType: .incoming)
}
