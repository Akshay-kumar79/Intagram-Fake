//
//  Post.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 15/11/24.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let owner: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, owner: NSUUID().uuidString, caption: "Akshay forever", likes: 212, imageUrl: "iron_man", timestamp: Date(), user: User.MOCK_USERS.randomElement()),
        .init(id: NSUUID().uuidString, owner: NSUUID().uuidString, caption: "Iron man forever", likes: 212, imageUrl: "iron_man", timestamp: Date(), user: User.MOCK_USERS.randomElement()),
        .init(id: NSUUID().uuidString, owner: NSUUID().uuidString, caption: "Doctor strange forever", likes: 212, imageUrl: "doctor_strange", timestamp: Date(), user: User.MOCK_USERS.randomElement()),
        .init(id: NSUUID().uuidString, owner: NSUUID().uuidString, caption: "Hulk forever", likes: 212, imageUrl: "hulk", timestamp: Date(), user: User.MOCK_USERS.randomElement()),
        .init(id: NSUUID().uuidString, owner: NSUUID().uuidString, caption: "Spider man forever", likes: 212, imageUrl: "spider_man", timestamp: Date(), user: User.MOCK_USERS.randomElement()),
    ]
}
