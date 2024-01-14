//
//  ProfileViewModel.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 05.01.24.
//

import SwiftUI
import PhotosUI

final class ProfileViewModel: ObservableObject {
    @Published var selectedPhotoItem: PhotosPickerItem? {
        didSet {
            Task { try await loadImage() }
        }
    }
    
    @Published var profileImage: Image?
    
    private func loadImage() async throws {
        guard let selectedPhotoItem,
              let imageData = try await selectedPhotoItem.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: imageData) else { return }
        profileImage = Image(uiImage: uiImage)
    }
}
