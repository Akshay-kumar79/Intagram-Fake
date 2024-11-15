//
//  AuthService.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 15/11/24.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }catch{
            print("Falied to login user: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        }catch{
            print("Falied to register user: \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    @MainActor
    func signOut() async throws {
        try Auth.auth().signOut()
        self.userSession = nil
    }
    
}
