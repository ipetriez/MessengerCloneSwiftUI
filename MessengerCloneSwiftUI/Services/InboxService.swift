//
//  InboxService.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 19.01.24.
//

import Foundation
import Firebase

final class InboxService {
    
    // MARK: — Public properties
    
    @Published var documentChanges = [DocumentChange]()
    
    // MARK: — Private properties
    
    private let messagesCollection = Firestore.firestore().collection("messages")
    
    // MARK: — Singleton
    
    static let shared = InboxService()
    
    private init() { }
    
    // MARK: — Public methods
    
    func observeRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let query = messagesCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added || $0.type == .modified }) else { return }
            self.documentChanges = changes
        }
    }
}
