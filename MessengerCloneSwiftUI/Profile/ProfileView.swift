//
//  ProfileView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 04.01.24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    private let user: User
    @StateObject var profileVM = ProfileViewModel()
    
    init(user: User) { self.user = user }
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $profileVM.selectedPhotoItem) {
                if let profileImage = profileVM.profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } else {
                    if let url = user.profileImageURL {
                        Image(url)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }
            }
            
            Text(user.fullName)
                .font(.title2)
                .fontWeight(.semibold)
        }
        
        List {
            Section {
                ForEach(SettingsOptionsViewModel.allCases, id: \.self) { option in
                    HStack {
                        Image(systemName: option.imageName)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(option.imageBackgroundColor)
                        
                        Text(option.title)
                            .font(.subheadline)
                    }
                }
            }
            
            Section {
                Button("Log Out") {
                    
                }
                
                Button("Delete Account") {
                    
                }
            }.foregroundStyle(.red)
        }
    }
}

#Preview {
    ProfileView(user: User.mockUser)
}
