//
//  User.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 05.01.24.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    let fullName: String
    let email: String
    let profileImageURL: String?
}

extension User {
    static let mockUser = User(fullName: "Ginger Dorrison", email: "gindor@mail.com", profileImageURL: "anyguy")
}
