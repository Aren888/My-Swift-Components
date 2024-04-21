//
//  EditProfileViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
    
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage() } }
    }
    @Published var profileImage: Image?
    @Published var isLoading = false
    private var uiImage: UIImage?
    
    func updateUserData() async throws {
        print("DEBUG: Update user data here")
        isLoading = true
        try await updateProfileImage()
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        DispatchQueue.main.async {
            self.profileImage = Image(uiImage: uiImage)
        }
    }
    
    @MainActor
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else {
            isLoading = false
            return
        }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else {
            isLoading = false
            return
        }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
        isLoading = false
    }
}
