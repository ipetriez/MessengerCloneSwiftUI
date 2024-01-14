//
//  ChatsItemView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 04.01.24.
//

import SwiftUI

struct ChatsItemView: View {
    var body: some View {
        HStack {
            CircularProfileImageView(user: .constant(.mockData), size: .medium)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Billy Willy")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Okay! No problem!")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.gray)
        }
        .frame(height: 72)
    }
}

#Preview {
    ChatsItemView()
}
