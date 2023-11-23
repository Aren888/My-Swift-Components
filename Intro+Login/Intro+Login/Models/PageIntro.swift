//
//  PageIntro.swift
//  Intro+Login
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

struct PageIntro: Identifiable, Hashable {
    var id: UUID = .init()
    var introAssertImage: String
    var title: String
    var subTitle: String
    var displaysAction: Bool = false
}

var pageIntros: [PageIntro] = [
    .init(introAssertImage: "Page 1", title: "Content With\nCreators Easily", subTitle: "Thank you for choosing us; we can save your lovely time."),
    .init(introAssertImage: "Page 2", title: "Get Inspiration\nFrom Creators", subTitle: "Find your favorite creator and get inspired by them."),
    .init(introAssertImage: "Page 3", title: "Let's\nGet Started", subTitle: "To register for an account, kindly enter your details.", displaysAction: true)
]
