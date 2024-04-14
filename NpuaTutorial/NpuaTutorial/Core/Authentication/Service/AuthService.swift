//
//  AuthService.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.12.23.
//

import Firebase
import FirebaseFirestoreSwift

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
            try await UserService.shared.fetchCurrentUser()
        } catch let error as NSError {
            print("DEBUG: Failed to signIn with error \(error.localizedDescription)")
            switch error.code {
            case AuthErrorCode.wrongPassword.rawValue:
                throw AuthError.passwordNotMatch
            case AuthErrorCode.userNotFound.rawValue:
                throw AuthError.emailNotMatch
            default:
                throw AuthError(errorCode: error.code)
            }
        } catch {
            throw AuthError.unknownError
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullName: fullName, userName: userName, id: result.user.uid)
        } catch let error as NSError {
            throw AuthError(errorCode: error.code)
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.reset()
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String, fullName: String, userName: String, id: String) async throws {
        let user = User(id: id, fullName: fullName, email: email, userName: userName)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
