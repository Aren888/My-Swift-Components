//
//  CurrentUserProfileViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var isLoading: Bool = true
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [ weak self ] user in
            self?.currentUser = user
            self?.isLoading = (self?.currentUser == nil)
        }.store(in: &cancellables)
    }
}
