//
//  OnboardingQuestionsViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

class OnboardingQuestionsViewModel: ObservableObject {
    
    @Published var percent: Int
    @Published var progressValue: Double
    @Published var progressIndex: Double
    
    init() {
        self.percent = 0
        self.progressValue = 0
        self.progressIndex = 0.1
    }
}
