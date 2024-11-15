//
//  PostGridView.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 15/11/24.
//

import SwiftUI

struct PostGridView: View {
    
    var posts: [Post]
    
    private let gridItem: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItem, spacing: 2) {
            ForEach(posts) { post in
                Rectangle()
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        Image(post.imageUrl)
                            .resizable()
                            .scaledToFill()
                    )
                    .clipShape(Rectangle())
            }
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POSTS)
}
