//
//  ProfileViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 12.12.23.
//

import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [ weak self ] user in
            self?.currentUser = user
                print("DEBUG: User in View model from combine is \(user)")
        }.store(in: &cancellables)
    }
}
