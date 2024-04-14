//
//  OnboardingQuestionsViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

class OnboardingQuestionsViewModel: ObservableObject {
    // MARK: - Published Properties
    
    @Published var percent: Int = 0
    @Published var nextViewCount: Int = 0
    @Published var progressValue: Double = 0.0
    @Published var progressIndex: Double = 0.1
    @Published var isContinueButtonEnabled: Bool = false
    // MARK: - Progress Control Functions
    
    /// Decreases the progress index by 0.1 if it's greater than 0.1 and updates the progress.
    func decreaseProgress() {
        if progressIndex > 0.1 {
            progressIndex -= 0.1
            updateProgress()
        }
    }
    
    /// Increases the progress index by 0.1 if it's less than 0.7 and updates the progress.
    func increaseProgress() {
        if progressIndex < 0.7 {
            progressIndex += 0.1
            updateProgress()
        }
    }
    
    /// Decreases the view count by 1 if it's greater than 0.
    func decreaseViewCount() {
        if nextViewCount > 0 {
            nextViewCount -= 1
        }
    }
    
    /// Increases the view count by 1 if it's less than 6.
    func increaseViewCount() {
        if nextViewCount < 6 {
            nextViewCount += 1
        }
    }
    
    // MARK: - Helper Functions
    
    /// Updates the progress value with animation based on the progress index and calculates the percentage.
    func updateProgress() {
        withAnimation(Animation.easeInOut(duration: 1.0)) {
            progressValue = progressIndex / 0.7
        }
        percent = Int(progressValue * 100)
        isContinueButtonEnabled = false
    }
}
