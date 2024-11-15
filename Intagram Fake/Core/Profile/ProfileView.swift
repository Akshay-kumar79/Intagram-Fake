//
//  ProfileView.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 13/11/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
            ScrollView {
                // Header
                ProfileHeaderView(user: user)
                
                // Post grid view
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
}

#Preview {
    ProfileView(user: User.MOCK_USERS.first!)
}
