//
//  PostService.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 17/11/24.
//

import Foundation
import FirebaseFirestore

struct PostService {
    
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = snapshot.documents.compactMap({ document in
            let post = try? document.data(as: Post.self)
            return post
        })
        
        for i in 0..<posts.count {
            let post = posts[i]
            let ownerUid = post.owner
            let postUser = try await UserService.fetchUser(withId: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("owner", isEqualTo: uid).getDocuments()
        var posts = snapshot.documents.compactMap({ document in
            let post = try? document.data(as: Post.self)
            return post
        })
        
        return posts
    }
    
}
