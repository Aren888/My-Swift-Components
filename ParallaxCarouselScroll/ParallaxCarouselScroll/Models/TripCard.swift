//
//  TripCard.swift
//  ParallaxCarouselScroll
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

// Model for a trip card with title, subtitle, and image
struct TripCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var image: String
}

// Sample trip cards data
var tripCards: [TripCard] = [
    .init(title: "London", subTitle: "England", image: "pic 1"),
    .init(title: "New York", subTitle: "USA", image: "pic 2"),
    .init(title: "Prague", subTitle: "Czech Republic", image: "pic 3"),
]
