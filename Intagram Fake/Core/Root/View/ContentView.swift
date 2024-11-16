//
//  ContentView.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewmodel = ContentViewModel()
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if viewmodel.userSession == nil {
                LoginView()
                    .environmentObject(authViewModel)
            } else if let currentUser = viewmodel.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
