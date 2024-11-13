//
//  ProfileView.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 13/11/24.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItem: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Header
                VStack(spacing: 10) {
                    // Pic and stats
                    HStack {
                        Image("iron_man")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 90, height: 80)
                            .clipShape(Circle())
                        
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
                        Text("Akshay kumar shaw")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        
                        Text("akshay7982")
                            .font(.footnote)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // action button
                    
                    Button{
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    }
                    
                    Divider()
                }
                
                // Post grid view
                LazyVGrid(columns: gridItem, spacing: 2) {
                    ForEach(0...15, id: \.self) { index in
                        Rectangle()
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(
                                Image("hulk")
                                    .resizable()
                                    .scaledToFill()
                            )
                            .clipShape(Rectangle())
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button{
                        
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
    ProfileView()
}
