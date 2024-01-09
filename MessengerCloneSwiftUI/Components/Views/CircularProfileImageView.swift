//
//  CircularProfileImageView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 05.01.24.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall, xSmall, small, medium, large, xLarge
    
    var diameter: CGFloat {
        switch self {
        case .xxSmall:
            28
        case .xSmall:
            32
        case .small:
            40
        case .medium:
            56
        case .large:
            64
        case .xLarge:
            80
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageURL = user.profileImageURL {
            Image(imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: size.diameter, height: size.diameter)
                .clipShape(.circle)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.diameter, height: size.diameter)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.mockData, size: .medium)
}
