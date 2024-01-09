//
//  ChatBubble.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 09.01.24.
//

import SwiftUI

struct ChatBubble: Shape {
    let messageType: ChatMessageView.MessageType
    
    func path(in rect: CGRect) -> Path {
        Path(UIBezierPath(roundedRect: rect,
                          byRoundingCorners: [.topRight, .topLeft, messageType == .incoming ? .bottomRight : .bottomLeft],
                          cornerRadii: CGSize(width: 16, height: 16)).cgPath)
    }
}

#Preview {
    ChatBubble(messageType: .incoming)
}
