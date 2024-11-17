//
//  User.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 14/11/24.
//

import Foundation
import FirebaseAuth

struct User: Codable, Identifiable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool{
        guard let currentUser = Auth.auth().currentUser else { return false }
        return id == currentUser.uid
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: nil, fullName: "Akshay kumar shaw", bio: "Hulk is star", email: "hulk@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venuom", profileImageUrl: nil, fullName: "venuom kumar shaw", bio: "venuom is star", email: "venuom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ironman", profileImageUrl: nil, fullName: "ironman kumar shaw", bio: "ironman is star", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spiderman", profileImageUrl: nil, fullName: nil, bio: "spiderman is star", email: "spiderman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "akshatman", profileImageUrl: nil, fullName: "akshatman kumar shaw", bio: "akshatman is star", email: "akshatman@gmail.com"),
    ]
}
