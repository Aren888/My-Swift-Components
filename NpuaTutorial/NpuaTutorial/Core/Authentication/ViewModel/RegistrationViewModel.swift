//
//  RegistrationViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.12.23.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var userName = ""
    
    @MainActor
    func createUser() async throws {
        print("DEBUG: Creating user...")
        do {
            try await AuthService.shared.createUser(
                withEmail: email,
                password: password,
                fullName: fullName,
                userName: userName
            )
            print("DEBUG: User created successfully.")
        } catch {
            print("DEBUG: Failed to create user. Error: \(error.localizedDescription)")
        }
    }
}
