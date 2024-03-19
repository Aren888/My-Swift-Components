//
//  OnboardingQuestionsViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

class OnboardingQuestionsViewModel: ObservableObject {
    @Published var percent: Int = 0
    @Published var progressValue: Double = 0.0
    @Published var progressIndex: Double = 0.1
    
    func decreaseProgress() {
        if progressIndex >= 0.2 {
            progressIndex -= 0.1
            updateProgress()
        }
    }
    
    func increaseProgress() {
        if progressIndex < 0.7 {
            progressIndex += 0.1
            updateProgress()
        }
    }
    
    func updateProgress() {
        withAnimation(Animation.easeInOut(duration: 1.0)) {
            progressValue = progressIndex / 0.7
        }
        percent = Int(progressValue * 100)
    }
}
