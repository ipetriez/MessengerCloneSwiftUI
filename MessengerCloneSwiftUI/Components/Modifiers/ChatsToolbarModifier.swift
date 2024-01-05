//
//  ChatsToolbarModifier.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 04.01.24.
//

import SwiftUI

struct ChatsToolbarModifier: ViewModifier {
    @Binding var user: User
    var action: () -> Void
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        NavigationLink(value: user) {
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { action() }, label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    })
                }
            }
    }
}
