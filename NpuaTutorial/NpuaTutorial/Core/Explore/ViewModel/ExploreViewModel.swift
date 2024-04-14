//
//  ExploreViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var isLoading: Bool = false

    init() {
        loadData()
    }
    
    func loadData() {
        isLoading = true
        Task {
            do {
                let fetchedUsers = try await UserService.fetchUsers()
                DispatchQueue.main.async { [weak self] in
                    self?.users = fetchedUsers
                    self?.isLoading = false
                }
            } catch {
                print("Error fetching users: \(error)")
                DispatchQueue.main.async { [weak self] in
                    self?.isLoading = false
                }
            }
        }
    }
}


