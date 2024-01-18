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
    
    init(user: User, messageText: String = "") {
        self.user = user
        self.messageText = messageText
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, to: user)
        messageText = ""
    }
}
