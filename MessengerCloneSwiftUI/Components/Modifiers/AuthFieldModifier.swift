//
//  AuthFieldModifier.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 02.01.24.
//

import SwiftUI

struct AuthFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
