//
//  SecondQuestionViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 21.03.24.
//

import SwiftUI

class SecondQuestionViewModel: ObservableObject {

    @Published var question: String = "How did you hear about Tong Ai?"
    @Published var buttonBGColor: Color = .black
    @Published var buttonMessageBGColor: Color = .white
    @Published var selectedButtonIndex: Int? = nil
    
    @Published var sections: [(String, String)] = [
        ("TikTok", "play.rectangle.fill"),
        ("TV", "tv.fill"),
        ("App Store", "square.grid.3x3.fill"),
        ("News/Article/Blog", "newspaper.fill"),
        ("Friends/Family", "person.2.fill"),
        ("YouTube", "play.rectangle.fill"),
        ("Google Search", "magnifyingglass"),
        ("Facebook/Instagram", "person.circle.fill"),
        ("Other", "ellipsis.circle.fill")
    ]
}
