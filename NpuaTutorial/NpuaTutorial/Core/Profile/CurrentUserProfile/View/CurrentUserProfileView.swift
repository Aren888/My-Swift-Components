//
//  CurrentUserProfileView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                HomeBackgroundCirclesView()
                VStack {
                    if viewModel.isLoading {
                        LoadingView()
                    } else {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 10) {
                                
                                ProfileHeaderView(user: currentUser)
                                    .padding(.horizontal)
                                
                                Button {
                                    showEditProfile.toggle()
                                } label: {
                                    Text("Edit Profile")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                        .frame(width: 352, height: 32)
                                        .background(.white.gradient)
                                        .cornerRadius(8)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color(.systemGray4), lineWidth: 1)
                                        }
                                }
                                
                                if let user = currentUser {
                                    UserContentListView(user: user)
                                }
                            }
                        }
                        .sheet(isPresented: $showEditProfile, content: {
                            if let user = currentUser {
                                EditProfileView(user: user)
                            }
                        })
                        
                    }
                }
            }
        }
        .navigationBarItems(trailing:
                                Button(action: {
            AuthService.shared.signOut()
        }) {
            Text("Log Out")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white.gradient)
                .cornerRadius(8)
        }
        )
    }
}

#Preview {
    CurrentUserProfileView()
}
