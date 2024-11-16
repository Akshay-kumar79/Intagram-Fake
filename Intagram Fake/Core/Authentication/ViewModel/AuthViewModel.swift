//
//  RegistrationViewModel.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 15/11/24.
//

import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var loginEmail: String = ""
    @Published var loginPassword: String = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        username = ""
        email = ""
        password = ""
    }
    
    func loginUser() async throws {
        try await AuthService.shared.login(email: loginEmail, password: loginPassword)
        loginEmail = ""
        loginPassword = ""
    }
    
}
