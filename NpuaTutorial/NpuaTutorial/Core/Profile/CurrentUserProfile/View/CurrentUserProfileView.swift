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
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    AuthService.shared.signOut()
                                } label: {
                                    Text("Log Out")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 2)
                                        .background(.white.gradient)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
