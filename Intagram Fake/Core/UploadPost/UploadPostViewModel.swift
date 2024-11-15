//
//  UploadPostViewModel.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 15/11/24.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task { await loadImage(forItem: selectedImage) }
        }
    }
    
    @Published var postImage: Image?
    
    func loadImage(forItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.postImage = Image(uiImage: uiImage)
    }
    
}
