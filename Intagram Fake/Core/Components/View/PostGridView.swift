//
//  PostGridView.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 15/11/24.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let gridItem: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItem, spacing: 2) {
            ForEach(viewModel.posts) { post in
                Rectangle()
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                    )
                    .clipShape(Rectangle())
            }
        }
    }
}

#Preview {
    PostGridView(user: User.MOCK_USERS.first!)
}
