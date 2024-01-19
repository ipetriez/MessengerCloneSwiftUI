//
//  ChatViewModel.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 18.01.24.
//

import Foundation

final class ChatViewModel: ObservableObject {
    let service: ChatServiceProtocol
    @Published var messageText: String
    @Published var messages = [TextMessage]()
    
    init(user: User, messageText: String = "") {
        self.service = ChatService(correspondent: user)
        self.messageText = messageText
        observeMessages()
    }
    
    func sendMessage() {
        service.sendMessage(messageText)
        messageText = ""
    }
    
    func observeMessages() {
        service.observeMessages { messages in
            self.messages.append(contentsOf: messages)
        }
    }
}
