//
//  MessageService.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 18.01.24.
//

import Foundation
import Firebase

struct MessageService {
    
    static let messagesCollection = Firestore.firestore().collection("messages")
    
    static func sendMessage(_ messageText: String, to user: User) {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        let currentUserDocRef = messagesCollection.document(currentUserID).collection(user.id).document()
        let chatPartnerCollectionRef = messagesCollection.document(user.id).collection(currentUserID)
        let messageID = currentUserDocRef.documentID
        let message = TextMessage(fromID: currentUserID, toID: user.id, messageText: messageText, timestamp: Timestamp())
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        currentUserDocRef.setData(messageData)
        chatPartnerCollectionRef.document(messageID).setData(messageData)
    }
}
