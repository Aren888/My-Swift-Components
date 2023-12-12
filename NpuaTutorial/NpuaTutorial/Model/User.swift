//
//  User.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 11.12.23.
//

import SwiftUI

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let userName: String
    var profileImageUrl: String?
    var bio: String?
}
