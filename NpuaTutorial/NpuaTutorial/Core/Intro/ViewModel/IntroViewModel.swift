//
//  IntroViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import Foundation

class IntroViewModel: ObservableObject {
    
    @Published var activeIntro: PageIntro = pageIntros[0]
    @Published var emailID: String = ""
    @Published var password: String = ""
    @Published var keyboardHeight: CGFloat = 0
    
    @Published var SignInTitle: String = "Already have an account?"
    @Published var SignInSubTitle: String = "Pick up where we left off."
    @Published var SignInButtonTitle: String = "Sign in"
    
    @Published var getStartedTitle: String =  "New to the app?"
    @Published var getStartedSubTitle: String =  "Start learning languages now"
    @Published var getStartedButtonTitle: String =  "Get Started"
}
