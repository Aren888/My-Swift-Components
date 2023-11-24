//
//  Card.swift
//  CardScroll
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

// MARK: - Card Model

/// A model representing a card with a unique identifier, background color, and balance.
struct Card: Identifiable {
    var id: UUID = .init()
    var bgColor: Color
    var balance: String
}

// MARK: - Sample Cards

/// An array containing sample cards for testing and demonstration purposes.
var cards: [Card] = [
    Card(bgColor: .red, balance: "$125,000"),
    Card(bgColor: .blue, balance: "$25,000"),
    Card(bgColor: .orange, balance: "$25,000"),
    Card(bgColor: .purple, balance: "$5,000"),
]
