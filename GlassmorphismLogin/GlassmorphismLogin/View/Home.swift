//
//  Home.swift
//  GlassmorphismLogin
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

struct Home: View {
    // MARK: - Properties
    
    // State variables for username and password
    @State private var username: String = ""
    @State private var password: String = ""
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            // Main content stack
            VStack(spacing: 12) {
                Text("Welcome!")
                    .font(.title.bold())
                
                // Username and password input fields
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Username")
                        .font(.callout.bold())
                    CustomTF(hint: "iJustine", value: $username)
                    
                    Text("Password")
                        .font(.callout.bold())
                        .padding(.top, 15)
                    CustomTF(hint: "•••••••••", value: $password, isPassword: true)
                    
                    // Login button
                    Button(action: {
                        // TODO: Implement login functionality
                    }, label: {
                        Text("Login")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.BG)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    })
                    .padding(.top, 30)
                })
                
                // Social login buttons
                HStack(spacing: 12) {
                    Button(action: {
                        // TODO: Implement email login functionality
                    }, label: {
                        Label("Email", systemImage: "envelope.fill")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background {
                                TransparentBlurView(removeAllFilters: true)
                                    .background(.white.opacity(0.2))
                            }
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    })
                    
                    Button(action: {
                        // TODO: Implement Apple login functionality
                    }, label: {
                        Label("Apple", systemImage: "applelogo")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background {
                                TransparentBlurView(removeAllFilters: true)
                                    .background(.white.opacity(0.2))
                            }
                            .clipShape(.rect(cornerRadius: 8, style: .continuous))
                    })
                }
                .foregroundStyle(.white)
                .padding(.top, 15)
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 30)
            .padding(.top, 35)
            .padding(.bottom, 25)
            .background {
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: 9, opaque: true)
                    .background(.white.opacity(0.05))
            }
            .clipShape(.rect(cornerRadius: 10, style: .continuous))
            
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.white.opacity(0.3), lineWidth: 1.5)
            }
            .shadow(color: .black.opacity(0.2), radius: 10)
            .padding(.horizontal, 40)
            
            // Background circles with gradients
            .background {
                ZStack {
                    Circle()
                        .fill(
                            .linearGradient(colors: [
                                .gradient1,
                                .gradient2
                            ], startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 140, height: 140)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .offset(x: -25, y: -55)
                    
                    Circle()
                        .fill(
                            .linearGradient(colors: [
                                .gradient3,
                                .gradient4
                            ], startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 140, height: 140)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .offset(x: 25, y: 55)
                }
            }
        }
        .frame(maxWidth: 390)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        // Background
        .background {
            Rectangle()
                .fill(.BG)
                .ignoresSafeArea()
        }
    }
    
    // MARK: - Custom TextField
    
    @ViewBuilder
    func CustomTF(hint: String, value: Binding<String>, isPassword: Bool = false) -> some View {
        Group {
            if isPassword {
                SecureField(hint, text: value)
            } else {
                TextField(hint, text: value)
            }
        }
        .environment(\.colorScheme, .dark)
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(.white.opacity(0.12))
        .clipShape(.rect(cornerRadius: 8, style: .continuous))
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
