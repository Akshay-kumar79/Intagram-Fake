//
//  EditProfileViewModel.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 16/11/24.
//

import Foundation
import PhotosUI
import SwiftUI
import FirebaseFirestore

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(forItem: selectedImage) }
        }
    }
    @Published var profileImage: Image?
    
    @Published var fullName: String = ""
    @Published var bio: String = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullName = user.fullName {
            self.fullName = fullName
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    @MainActor
    func loadImage(forItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        
        self.profileImage = Image(uiImage: uiImage)
    }
    
    @MainActor
    func updateUserData() async throws {
        
        var data = [String: Any]()
        
        // update profile if changed
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        // update name if changed
        if !fullName.isEmpty && fullName != user.fullName {
            data["fullName"] = fullName
        }
        
        // update bio if changed
        if !bio.isEmpty && bio != user.bio {
            data["fullName"] = bio
        }
        
        if data.isEmpty { return }
        try await Firestore.firestore().collection("users").document(user.id).updateData(data)
    }
    
}
