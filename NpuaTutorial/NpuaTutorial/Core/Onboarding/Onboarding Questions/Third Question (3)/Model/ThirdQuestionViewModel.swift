//
//  ThirdQuestionViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 21.03.24.
//

import SwiftUI

class ThirdQuestionViewModel: ObservableObject {
    
    @Published var question: String = "How much English do you know?"
    @Published var buttonBGColor: Color = .black
    @Published var buttonMessageBGColor: Color = .white
    @Published var selectedButtonIndex: Int? = nil
    
    @Published var sections: [(String, String)] = [
        ("I'm new to English", "flag.fill"),
        ("I know some words and phrases", "book.fill"),
        ("I can have simple conversations", "message.fill"),
        ("I am intermediate or higher", "star.fill")
    ]
}
