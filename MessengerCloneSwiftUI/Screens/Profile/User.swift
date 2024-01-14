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
}

extension User {
    static let mockData = User(fullName: "Ginger Dorrison", email: "gindor@mail.com", profileImageURL: "anyguy")
}
