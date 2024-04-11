//
//  SixthQuestionViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 07.04.24.
//

import SwiftUI

class SixthQuestionViewModel: ObservableObject {
    
    @Published var question: String = "Here's what you can achieve in 3 months!"
    @Published var buttonBGColor: Color = .black
    @Published var buttonMessageBGColor: Color = .white
    @Published var selectedButtonIndex: Int? = nil
    
    @Published var sections: [(String, String, String)] = [
        ("Converse with confidence", "Stress-free speaking and listening exercises", "message.fill"),
        ("Build up your vocabulary", "Common words and practical phrases", "book.fill"),
        ("Develop a learning habit", "Smart reminders, fun challenges, and more", "clock.fill"),
        ("Enhance your speaking skills", "Improve fluency through interactive exercises", "mic.fill"),
        ("Expand your grammar knowledge", "Learn essential grammatical structures", "square.and.pencil"),
        ("Practice reading comprehension", "Improve understanding through diverse texts", "book.circle.fill")
    ]
}
