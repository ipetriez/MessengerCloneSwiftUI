//
//  ActiveNowView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 04.01.24.
//

import SwiftUI

struct ActiveNowView: View {
    @StateObject var activeNowVM = ActiveNowViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32) {
                ForEach(activeNowVM.users) { user in
                    NavigationLink(destination: ChatView(user: user)) {
                        VStack {
                            ZStack(alignment: .bottomTrailing) {
                                CircularProfileImageView(user: .constant(user), size: .medium)
                                
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 18, height: 18)
                                    Circle()
                                        .fill(.green)
                                        .frame(width: 12, height: 12)
                                }
                            }
                            
                            Text(user.firstName)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveNowView()
}
