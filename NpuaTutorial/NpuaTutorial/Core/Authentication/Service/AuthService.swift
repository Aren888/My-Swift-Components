//
//  AuthService.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.12.23.
//

import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Create user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: User created successfully with UID: \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user. Error: \(error.localizedDescription)")
        }
    }
    
    func singOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
