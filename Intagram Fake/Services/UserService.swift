//
//  UserService.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 16/11/24.
//

import Foundation
import FirebaseFirestore

struct UserService {
    
    
    static func fetchUser(withId id: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(id).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    @MainActor
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
    
    
}
