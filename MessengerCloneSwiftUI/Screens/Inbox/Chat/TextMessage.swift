//
//  TextMessage.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 18.01.24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct TextMessage: Identifiable, Codable {
    @DocumentID var messageID: String?
    var fromID: String
    var toID: String
    var messageText: String
    var timestamp: Timestamp
    
    var id: String {
        messageID ?? NSUUID().uuidString
    }
    
    var chatPartnerID: String {
        fromID == Auth.auth().currentUser?.uid ? toID : fromID
    }
    
    var isFromCurrentUser: Bool {
        fromID == Auth.auth().currentUser?.uid
    }
}
