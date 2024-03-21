//
//  StartOnboardingViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 12.03.24.
//

import SwiftUI

class StartOnboardingViewModel: ObservableObject {
    @Published var isShowQuestionMessage: Bool = false
    @Published var isPushQuestionsView: Bool = false
    
    let welcomeMessage: String = "Hi There! I'm Tong Ai."
    let questionMessage: String = "Just 7 quick questions before we begin your first lesson."
    let continueButtonTitle: String = "Continue"
    
    func toggleShowQuestionMessage() {
        withAnimation {
            isShowQuestionMessage.toggle()
        }
    }
}
