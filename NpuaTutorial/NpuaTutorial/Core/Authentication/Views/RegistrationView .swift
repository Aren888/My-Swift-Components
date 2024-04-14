//
//  RegistrationView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 30.11.23.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
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
                
                TextField("Enter full name", text: $viewModel.fullName)
                    .modifier(TextFieldsModifier())
                
                TextField("Enter username", text: $viewModel.userName)
                    .autocapitalization(.none)
                    .modifier(TextFieldsModifier())
            }
            
            Button {
                Task { viewModel.createUser() }
            } label: {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.white)
                } else {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 44)
                        .background(Color.black)
                        .cornerRadius(8)
                }
            }
            .padding(.vertical)
            .disabled(viewModel.isLoading)
            .alert("Error", isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { _ in viewModel.errorMessage = nil }
            )) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundStyle(.black)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
