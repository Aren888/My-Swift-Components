//
//  FourthQuestionViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 07.04.24.
//

import Foundation
import SwiftUI

class FourthQuestionViewModel: ObservableObject {
    
    @Published var question: String = "Where are you learning Spanish?"
    @Published var buttonBGColor: Color = .black
    @Published var buttonMessageBGColor: Color = .white
    @Published var selectedButtonIndex: Int? = nil
    
    @Published var sections: [(String, String)] = [
        ("To boost my career", "bolt.fill"),
        ("To connect with people", "person.2.fill"),
        ("Just for fun", "smiley.fill"),
        ("To support my education", "book.fill"),
        ("To spend time productively", "hammer.fill"),
        ("To prepare for travel", "airplane"),
        ("Other", "ellipsis")
    ]
}
