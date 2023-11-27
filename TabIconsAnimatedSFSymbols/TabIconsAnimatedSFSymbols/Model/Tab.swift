//
//  Tab.swift
//  TabIconsAnimatedSFSymbols
//
//  Created by Solicy Ios on 27.11.23.
//

import SwiftUI

// MARK: - Tab Enumeration

enum Tab: String, CaseIterable {
    case photos = "photo.stack"
    case chat = "bubble.left.and.text.bubble.right"
    case apps = "square.3.layers.3d"
    case notifications = "bell.and.waves.left.and.right"
    case profile = "person.2.crop.square.stack.fill"
    
    // MARK: - Computed Property: Title
    
    var title: String {
        switch self {
        case .photos:
            return "Photos"
        case .chat:
            return "Chat"
        case .apps:
            return "Apps"
        case .notifications:
            return "Notifications"
        case .profile:
            return "Profile"
        }
    }
}

// MARK: - AnimatedTab Structure

struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimating: Bool?
}
