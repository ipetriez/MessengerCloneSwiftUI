//
//  User.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 05.01.24.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    @DocumentID var firebaseDocumentID: String?
    var id: String { firebaseDocumentID ?? NSUUID().uuidString }
    let fullName: String
    let email: String
    let profileImageURL: String?
    
    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullName)
        return components?.givenName ?? fullName
    }
}

extension User {
    static let mockData = User(fullName: "Ginger Dorrison", email: "gindor@mail.com", profileImageURL: "anyguy")
}
