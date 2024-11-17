//
//  CurrentUserProfile.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 14/11/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
   
    var body: some View {
        NavigationStack {
            ScrollView {
                // Header
                ProfileHeaderView(user: user)
                
                // Post grid view
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button{
                        Task { try await AuthService.shared.signOut() }
                    }label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                })
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS.first!)
}
