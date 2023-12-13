//
//  User.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 11.12.23.
//

import SwiftUI

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullName: String
    let email: String
    let userName: String
    var profileImageUrl: String?
    var bio: String?
}
