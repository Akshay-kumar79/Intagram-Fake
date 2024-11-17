//
//  CircularProfileImageView.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 17/11/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimensions: CGFloat {
        switch self {
        case .xSmall: return 40
        case .small: return 48
        case .medium: return 64
        case .large: return 80
        }
    }
}

struct CircularProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
        }else{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USERS.first!, size: .large)
}
