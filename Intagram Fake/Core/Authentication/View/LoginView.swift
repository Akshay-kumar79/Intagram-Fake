//
//  LoginView.swift
//  Intagram Fake
//
//  Created by Akshay kumar shaw on 14/11/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Logo Image
                Image("instagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                // Text Fields
                VStack {
                    TextField("Enter your email", text: $viewModel.loginEmail)
                        .autocapitalization(.none)
                        .modifier(IGTextFeildModifier())
                    
                    SecureField("Password", text: $viewModel.loginPassword)
                        .modifier(IGTextFeildModifier())
                }
                
                // Foregot password button
                Button {
                    
                }label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                // Login Button
                Button {
                    Task{
                        try await viewModel.loginUser()
                    }
                }label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                .padding(.vertical)
                
                
                // Or divider
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)

                // Login with facebook
                HStack {
                    Image("facebook_logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                Divider()
                
                NavigationLink{
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                }label: {                
                    HStack {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)

                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
