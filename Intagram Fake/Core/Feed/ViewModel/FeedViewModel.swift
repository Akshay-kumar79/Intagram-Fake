//
//  FeedViewModel.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 17/11/24.
//

import Foundation
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
