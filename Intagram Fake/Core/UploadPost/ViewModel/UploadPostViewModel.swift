//
//  UploadPostViewModel.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 15/11/24.
//

import Foundation
import PhotosUI
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(forItem: selectedImage) }
        }
    }
    
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    func loadImage(forItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, owner: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        guard let encodedPost  = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
    
}
