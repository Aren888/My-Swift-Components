//
//  AuthService.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.12.23.
//

import Firebase

class AuthService {
    
    static let shared = AuthService()
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        // Your login implementation goes here
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: User created successfully with UID: \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user. Error: \(error.localizedDescription)")
        }
    }
}
