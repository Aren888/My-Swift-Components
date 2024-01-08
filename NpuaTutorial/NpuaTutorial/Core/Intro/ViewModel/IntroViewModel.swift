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
}
