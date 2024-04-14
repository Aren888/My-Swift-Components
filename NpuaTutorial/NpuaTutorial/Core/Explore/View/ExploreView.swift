//
//  ExploreView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 01.12.23.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return viewModel.users
        } else {
            return viewModel.users.filter { user in
                return user.userName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                HomeBackgroundCirclesView()
                VStack(spacing: 0) {
                    if viewModel.isLoading {
                        LoadingView()
                    } else {
                        ScrollView {
                            VStack(spacing: 4) {
                                ForEach(filteredUsers) { user in
                                    NavigationLink(destination: ProfileView(user: user)) {
                                        VStack(spacing: 0) {
                                            UserCell(user: user)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadData()
        }
        .searchable(text: $searchText, prompt: "Search")
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ExploreView()
}
