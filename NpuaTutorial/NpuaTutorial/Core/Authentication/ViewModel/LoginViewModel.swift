//
//  LoginViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    func login() {
        isLoading = true
        guard validateInputs() else {
            isLoading = false
            return
        }
        Task {
            do {
                try await AuthService.shared.login(withEmail: email, password: password)
            } catch let error as AuthError {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "An unknown error occurred."
                    self.isLoading = false
                }
            }
        }
    }
    
    private func validateInputs() -> Bool {
        guard !email.isEmpty else {
            errorMessage = "Email cannot be empty."
            return false
        }
        guard !password.isEmpty else {
            errorMessage = "Password cannot be empty."
            return false
        }
        return true
    }
}
