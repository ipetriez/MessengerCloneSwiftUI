//
//  ChatsItemView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 04.01.24.
//

import SwiftUI
import Firebase

struct ChatsItemView: View {
    @State var message: TextMessage
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: .constant(message.user), size: .medium)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(message.user?.fullName ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(message.messageText)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("\(message.timestamp.dateValue())")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.gray)
        }
        .frame(height: 72)
    }
}

#Preview {
    ChatsItemView(message: TextMessage(fromID: "", toID: "", messageText: "This is a sample message text.", timestamp: Timestamp()))
}
