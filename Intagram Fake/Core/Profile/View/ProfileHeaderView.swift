//
//  ProfileHeaderView.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 15/11/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State private var showEditProfile: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            // Pic and stats
            HStack {
                CircularProfileImageView(user: user, size: .large)
                
                Spacer()
                HStack(spacing: 8){
                    UserStatView(value: 3, label: "Posts")
                    UserStatView(value: 3, label: "Followers")
                    UserStatView(value: 3, label: "Following")
                }
            }
            .padding(.horizontal)
            
            // name and bio
            VStack(alignment: .leading, spacing: 4){
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            
            Button{
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }else{
                    
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? Color.white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? Color.black : Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    )
            }
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS.first!)
}
