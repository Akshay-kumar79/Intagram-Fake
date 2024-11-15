//
//  FeedCell.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 14/11/24.
//

import SwiftUI

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            // Image + user name
            HStack {
                if let user = post.user {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading)
            
            // Post image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
                
            
            // action buttons
            HStack(spacing: 12) {
                Button{
                    
                }label: {
                    Image(systemName: "heart")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Button{
                    
                }label: {
                    Image(systemName: "bubble.right")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Button{
                    
                }label: {
                    Image(systemName: "paperplane")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 8)
            .foregroundColor(.black)
            
            // Likes label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .padding(.top, 1)
            
            // Caption label
            HStack {
                Text("\(post.user?.username  ?? "") ")
                    .fontWeight(.semibold) +
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 12)
            .padding(.top, 1)
            
            // Post time label
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .padding(.top, 1)
                .foregroundColor(.gray)

        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS.randomElement()!)
}
