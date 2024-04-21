//
//  BookCategory.swift
//  Tong Ai
//
//  Created by Solicy Office on 19.04.24.
//

import Foundation


enum BookCategory: String, Identifiable, CaseIterable {
    case fiction
    case biography
    case children
    case computerScience
    case fantasy
    case business
  
    
    var id: Self { return self }
    
    var displayName: String {
        switch self {
        case .fiction:
            "Technology and Innovation"
        case .biography:
            "Business English"
        case .children:
            "Media and Entertainment"
        case .computerScience:
            "Everyday Conversations"
        case .fantasy:
            "Culture and Customs"
        case .business:
            "Health and Wellness"
        }
    }
}
