//
//  LoginView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 30.11.23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            Image("ai-model-image-1")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.gradient, lineWidth: 1)
                        .backgroundStyle(.white)
                        .shadow(color: .black, radius: 7, x: 0, y: 0)

                )
                .padding(.bottom)
            
            Text("Tong Ai")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(10)
                .padding(.bottom)
                .shadow(color: .gray, radius: 20, x: 0.10, y: 0.10)
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(TextFieldsModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(TextFieldsModifier())
            }
            
            NavigationLink {
                Text("Forgot password")
            } label: {
                Text("Forgot Password")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .padding(.trailing, 28)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Button {
                Task{ try await viewModel.login() }
            } label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 352, height: 44)
                    .background(.black.gradient)
                    .cornerRadius(8)
            }
            
            Spacer()
            
            Divider()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack(spacing: 3) {
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundStyle(.black)
            }
            .padding(.vertical, 16)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
}
