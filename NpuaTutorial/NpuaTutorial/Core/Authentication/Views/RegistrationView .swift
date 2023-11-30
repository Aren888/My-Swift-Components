//
//  RegistrationView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 30.11.23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .modifier(TextFieldsModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(TextFieldsModifier())
                
                TextField("Enter full name", text: $fullName)
                    .modifier(TextFieldsModifier())
                
                TextField("Enter username", text: $userName)
                    .modifier(TextFieldsModifier())
            }
            
            Button {
                // Add your sign-up logic here
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                
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

#if DEBUG
#Preview {
    RegistrationView()
}
#endif
