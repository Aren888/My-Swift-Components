//
//  RegistrationViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.12.23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var userName = ""
    
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    func createUser() {
        isLoading = true
        guard validateInputs() else {
            isLoading = false
            return
        }
        Task {
            do {
                try await AuthService.shared.createUser(
                    withEmail: email,
                    password: password,
                    fullName: fullName,
                    userName: userName
                )
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    resetFields()
                    isLoading = false
                }
            } catch let error as AuthError {
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    errorMessage = error.localizedDescription
                    isLoading = false
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    errorMessage = "An unknown error occurred."
                    isLoading = false
                }
            }
        }
    }
    
    private func resetFields() {
        email = ""
        password = ""
        fullName = ""
        userName = ""
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
        guard !fullName.isEmpty else {
            errorMessage = "Full name cannot be empty."
            return false
        }
        guard fullName.isValidFullName else {
            errorMessage = "Invalid full name format."
            return false
        }
        guard !userName.isEmpty else {
            errorMessage = "Username cannot be empty."
            return false
        }
        guard userName.isValidUserName else {
            errorMessage = "Invalid username format."
            return false
        }
        return true
    }
}
