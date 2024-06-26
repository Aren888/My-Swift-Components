//
//  ChatAuditoriaViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import Foundation

@MainActor
class ChatAuditoriaViewModel: ObservableObject {
    @Published var threads = [Thread]()
    @Published var isLoading: Bool = true
    
    init() {
        Task { try await fetchThreads() }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        self.isLoading = false
        try await fetchUserDataForThreads()
    }
    
    private func fetchUserDataForThreads() async throws {
        for i in 0..<threads.count {
            let thread = threads[i]
            let ownerUID = thread.ownerUID
            let threadUser = try await UserService.fetchUser(withUid: ownerUID)
            
            threads[i].user = threadUser
        }
    }
}
