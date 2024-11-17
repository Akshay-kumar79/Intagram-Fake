//
//  IGTextFeildModifier.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 14/11/24.
//

import SwiftUI

struct IGTextFeildModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 28)
    }
}
