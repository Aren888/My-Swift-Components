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
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
            .refreshable {
                Task { try await viewModel.fetchThreads() }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChatAuditoriaView()
    }
}
