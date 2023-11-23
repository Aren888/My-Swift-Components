//
//  Like.swift
//  Reels
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

// MARK: - Like

/// A model representing a 'like' interaction on a Reel.
struct Like: Identifiable {
    
    // MARK: Properties
    
    var id: UUID = UUID()
    var tappedRect: CGPoint = .zero
    var isAnimated: Bool = false
}
