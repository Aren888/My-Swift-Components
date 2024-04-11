//
//  FifthQuestionViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 07.04.24.
//

import Foundation
import SwiftUI

class FifthQuestionViewModel: ObservableObject {
    
    @Published var question: String = "What's your daily learning goal?"
    @Published var buttonBGColor: Color = .black
    @Published var buttonMessageBGColor: Color = .white
    @Published var selectedButtonIndex: Int? = nil
    
    @Published var sections: [(String, String)] = [
        ("5 minutes/day", "Casual"),
        ("10 minutes/day", "Regular"),
        ("15 minutes/day", "Serious"),
        ("20 minutes/day", "Intense")
    ]
}
