//
//  ChatView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 05.01.24.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CircularProfileImageView(user: User.mockData, size: .xLarge)
                    
                    VStack(spacing: 4) {
                        Text(User.mockData.fullName)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messanger")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                }
                
                ForEach(0 ... 15, id: \.self) { message in
                    ChatMessageView(messageType: Bool.random() == true ? .incoming : .outcoming)
                }
                
            }
            
            Spacer()
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(.capsule)
                    .font(.subheadline)
                
                Button("Send") {
                    
                }
                .fontWeight(.semibold)
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    ChatView()
}
