//
//  EditProfileView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.12.23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.bottom, .horizontal])
                VStack {
                    // Name and profile image
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Name")
                                    .fontWeight(.semibold)
                                Text(user.fullName)
                            }
                            Spacer()
                            
                            PhotosPicker(selection: $viewModel.selectedItem) {
                                if let image = viewModel.profileImage {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                } else {
                                    CircularProfileImageView(user: user, size: .small)
                                }
                            }
                        }
                        
                        Divider()
                        // Bio field
                        
                        VStack(alignment: .leading) {
                            Text("Bio")
                                .fontWeight(.semibold)
                            TextField("Enter your bio...", text: $bio)
                        }
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("Link")
                                .fontWeight(.semibold)
                            TextField("Add link...", text: $link)
                        }
                        
                        Divider()
                        
                        Toggle("Private Profile", isOn: $isPrivateProfile)
                    }
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: dev.user)
    }
}
