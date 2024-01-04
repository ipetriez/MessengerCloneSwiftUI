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
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundStyle(Color(.systemGray4))
            
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
