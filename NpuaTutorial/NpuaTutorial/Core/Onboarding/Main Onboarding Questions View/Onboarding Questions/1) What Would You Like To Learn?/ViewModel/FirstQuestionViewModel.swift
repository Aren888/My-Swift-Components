//
//  FirstQuestionViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 19.03.24.
//

import SwiftUI

class FirstQuestionViewModel: ObservableObject {
    
    @Published var question: String = "What Would You Like To Learn?"
    @Published var title: String = "For English speakers"
    @Published var buttonBGColor: Color = .black
    @Published var buttonMessageBGColor: Color = .white
    @Published var selectedButtonIndex: Int? = nil
    
    
    @Published var sections: [FlagsAndLanguages] = [
        FlagsAndLanguages(language: "English", flag: "🇺🇸"),
        FlagsAndLanguages(language: "Armenian", flag: "🇦🇲"),
        FlagsAndLanguages(language: "Russian", flag: "🇷🇺"),
        FlagsAndLanguages(language: "Spanish", flag: "🇪🇸"),
        FlagsAndLanguages(language: "Mandarin Chinese", flag: "🇨🇳"),
        FlagsAndLanguages(language: "Hindi", flag: "🇮🇳"),
        FlagsAndLanguages(language: "French", flag: "🇫🇷"),
        FlagsAndLanguages(language: "Arabic", flag: "🇸🇦"),
        FlagsAndLanguages(language: "Bengali", flag: "🇧🇩"),
        FlagsAndLanguages(language: "Portuguese", flag: "🇵🇹"),
        FlagsAndLanguages(language: "Urdu", flag: "🇵🇰"),
        FlagsAndLanguages(language: "German", flag: "🇩🇪"),
        FlagsAndLanguages(language: "Japanese", flag: "🇯🇵"),
        FlagsAndLanguages(language: "Swahili", flag: "🇰🇪"),
        FlagsAndLanguages(language: "Korean", flag: "🇰🇷"),
        FlagsAndLanguages(language: "Turkish", flag: "🇹🇷"),
        FlagsAndLanguages(language: "Italian", flag: "🇮🇹"),
        FlagsAndLanguages(language: "Dutch", flag: "🇳🇱"),
        FlagsAndLanguages(language: "Polish", flag: "🇵🇱"),
        FlagsAndLanguages(language: "Thai", flag: "🇹🇭"),
        FlagsAndLanguages(language: "Vietnamese", flag: "🇻🇳")
    ]
}
