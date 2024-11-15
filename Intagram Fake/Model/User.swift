//
//  User.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 14/11/24.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", profileImageUrl: "hulk", fullName: "Akshay kumar shaw", bio: "Hulk is star", email: "hulk@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venuom", profileImageUrl: "doctor_strange", fullName: "venuom kumar shaw", bio: "venuom is star", email: "venuom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ironman", profileImageUrl: "iron_man", fullName: "ironman kumar shaw", bio: "ironman is star", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spiderman", profileImageUrl: "spider_man", fullName: nil, bio: "spiderman is star", email: "spiderman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "akshatman", profileImageUrl: "doctor_strange", fullName: "akshatman kumar shaw", bio: "akshatman is star", email: "akshatman@gmail.com"),
    ]
}
