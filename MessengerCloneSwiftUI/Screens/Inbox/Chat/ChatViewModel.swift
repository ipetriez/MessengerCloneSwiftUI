//
//  ChatViewModel.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 18.01.24.
//

import Foundation

final class ChatViewModel: ObservableObject {
    let user: User
    @Published var messageText: String
    @Published var messages = [TextMessage]()
    
    init(user: User, messageText: String = "") {
        self.user = user
        self.messageText = messageText
        observeMessages()
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, to: user)
        messageText = ""
    }
    
    func observeMessages() {
        MessageService.observeMessages(with: user) { messages in
            self.messages.append(contentsOf: messages)
        }
    }
}
