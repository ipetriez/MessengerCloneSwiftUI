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
    
    static func sendMessage(_ messageText: String, to correspondent: User) {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        let currentUserDocRef = messagesCollection
            .document(currentUserID)
            .collection(correspondent.id)
            .document()
        
        let chatPartnerCollectionRef = messagesCollection
            .document(correspondent.id)
            .collection(currentUserID)
        
        let messageID = currentUserDocRef.documentID
        let message = TextMessage(fromID: currentUserID, toID: correspondent.id, messageText: messageText, timestamp: Timestamp())
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        currentUserDocRef.setData(messageData)
        chatPartnerCollectionRef.document(messageID).setData(messageData)
    }
    
    static func observeMessages(with correspondent: User, completion: @escaping ([TextMessage]) -> Void) {
        guard let currentUserID = Auth.auth().currentUser?.uid else { return }
        let query = messagesCollection
            .document(currentUserID)
            .collection(correspondent.id)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap { try? $0.document.data(as: TextMessage.self) }
            
            for (index, message) in messages.enumerated() where !message.isFromCurrentUser {
                messages[index].user = correspondent
            }
            completion(messages)
        }
    }
}
