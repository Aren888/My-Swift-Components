//
//  PreviewProvider.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullName: "Max Verstappen", email: "max@gmail.com", userName: "maxverstappen1")
    
    let thread = Thread(ownerUID: "123", caption: "This is test thread", timestamp: Timestamp(), likes: 0)
}
