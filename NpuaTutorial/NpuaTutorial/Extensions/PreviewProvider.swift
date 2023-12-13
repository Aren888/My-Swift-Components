//
//  PreviewProvider.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 13.12.23.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullName: "Aren Musayelyan", email: "aren.musayelyan555@gmail.com", userName: "arenmusayelyan1")
}
