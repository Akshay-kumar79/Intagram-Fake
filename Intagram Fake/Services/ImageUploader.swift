//
//  ImageUploader.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 16/11/24.
//

import Foundation
import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = UUID().uuidString
        let filePath = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await filePath.putDataAsync(imageData)
            let url = try await filePath.downloadURL()
            return url.absoluteString
        }catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
