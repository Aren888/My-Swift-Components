//
//  PageIntro.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import SwiftUI

// Struct representing an onboarding page
struct PageIntro: Identifiable, Hashable {
    var id: UUID = .init()
    var introAssertImage: String
    var title: String
    var subTitle: String
    var displaysAction: Bool = false
}

// Array of onboarding pages with sample content
var pageIntros: [PageIntro] = [
    // Onboarding page 1
    .init(introAssertImage: "Page 1",
          title: "Content With\nCreators Easily",
          subTitle: "Thank you for choosing us; we can save your lovely time."),
    
    // Onboarding page 2
    .init(introAssertImage: "Page 2",
          title: "Get Inspiration\nFrom Creators",
          subTitle: "Find your favorite creator and get inspired by them."),
    
    // Onboarding page 3
    .init(introAssertImage: "Page 3",
          title: "",
          subTitle: "",
          displaysAction: true)
]
