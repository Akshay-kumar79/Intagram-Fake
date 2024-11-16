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
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(forItem: selectedImage) }
        }
    }
    
    @Published var profileImage: Image?
    @Published var fullName: String = ""
    @Published var bio: String = ""
    
    func loadImage(forItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.profileImage = Image(uiImage: uiImage)
    }
    
}
