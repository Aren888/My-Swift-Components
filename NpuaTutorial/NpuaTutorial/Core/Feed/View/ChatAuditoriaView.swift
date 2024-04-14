//
//  ChatAuditoriaView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 01.12.23.
//

import SwiftUI

struct ChatAuditoriaView: View {
    @StateObject var viewModel = ChatAuditoriaViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                HomeBackgroundCirclesView()
                VStack {
                    if viewModel.isLoading {
                        LoadingView()
                    } else {
                        ScrollView(showsIndicators: false) {
                            LazyVStack {
                                ForEach(viewModel.threads) { thread in
                                    ThreadCell(thread: thread)
                                }
                            }
                        }
                        .refreshable {
                            Task {
                                try await viewModel.fetchThreads()
                            }
                        }
                        .navigationTitle("Threads")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
        }
        .task {
            do {
                try await viewModel.fetchThreads()
                viewModel.isLoading = false
            } catch {
                print("Error fetching threads: \(error)")
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChatAuditoriaView()
    }
}
