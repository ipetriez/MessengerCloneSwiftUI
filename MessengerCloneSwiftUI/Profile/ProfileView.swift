//
//  ProfileView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 04.01.24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(Color(.systemGray4))
            
            Text("Billy Willie")
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
    ProfileView()
}
