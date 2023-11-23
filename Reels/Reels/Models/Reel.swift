//
//  Reel.swift
//  Reels
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

// MARK: - Reel

/// A model representing a Reel item.
struct Reel: Identifiable {
    
    // MARK: Properties
    
    var id: UUID = UUID()
    var videoID: String
    var authorName: String
    var isLiked: Bool = false
}

// MARK: - Sample Reels Data

/// A collection of sample Reel data for testing and previewing.
var reelsData: [Reel] = [
    .init(videoID: "Reel 1", authorName: "Tima Miroshnichenko"),
    .init(videoID: "Reel 2", authorName: "Trippy Clicker"),
    .init(videoID: "Reel 3", authorName: "Tima Miroshnichenko"),
    .init(videoID: "Reel 4", authorName: "Ana Bent"),
    .init(videoID: "Reel 5", authorName: "Anna Medvedeva")
]
