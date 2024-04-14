//
//  AuthServiceModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 14.04.24.
//

import Foundation

enum AuthError: Error {
    case emailAlreadyInUse
    case invalidEmail
    case weakPassword
    case passwordNotMatch
    case emailNotMatch
    case unknownError
    
    var localizedDescription: String {
        switch self {
        case .emailAlreadyInUse:
            return "Email is already in use."
        case .invalidEmail:
            return "Invalid email format."
        case .weakPassword:
            return "Password is too weak."
        case .passwordNotMatch:
            return "Password does not match."
        case .emailNotMatch:
            return "Email does not match."
        case .unknownError:
            return "An unknown error occurred."
        }
    }
    
    init(errorCode: Int) {
        switch errorCode {
        case AuthErrorCode.emailAlreadyInUse.rawValue:
            self = .emailAlreadyInUse
        case AuthErrorCode.invalidEmail.rawValue:
            self = .invalidEmail
        case AuthErrorCode.weakPassword.rawValue:
            self = .weakPassword
        default:
            self = .unknownError
        }
    }
}
