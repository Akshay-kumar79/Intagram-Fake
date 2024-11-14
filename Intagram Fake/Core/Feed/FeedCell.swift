//
//  FeedCell.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 14/11/24.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            // Image + user name
            HStack {
                Image("doctor_strange")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("Akshay kumar shaw")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading)
            
            // Post image
            Image("doctor_strange")
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
            Text("12 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .padding(.top, 1)
            
            // Caption label
            HStack {
                Text("Doctor strange ")
                    .fontWeight(.semibold) +
                Text("is back to our universe. Let's see what happens now on Earth!")
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
    FeedCell()
}
