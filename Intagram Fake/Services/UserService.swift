//
//  UserService.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 16/11/24.
//

import Foundation
import FirebaseFirestore

struct UserService {
    
    @MainActor
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
}
