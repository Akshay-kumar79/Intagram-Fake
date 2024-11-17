//
//  UserStatView.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 13/11/24.
//

import SwiftUI

struct UserStatView: View {
    
    let value: Int
    let label: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(label)
                .font(.footnote)
        }
        .frame(width: 76)

    }
}

#Preview(traits: .sizeThatFitsLayout) {
    UserStatView(value: 3, label: "Following")
}
