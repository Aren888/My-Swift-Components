//
//  HomeViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 22.01.24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var defaultBlurRadius: CGFloat
    @Published var defaultSaturationAmount: CGFloat
    @Published var activateGlassMorphism: Bool
    @Published var isViewDisplayed: Bool
    @Published var topPadding: CGFloat
    @Published var screenHeight: CGFloat
    @Published var horizontalPadding: CGFloat
    @Published var cornerRadius: CGFloat
    
    init() {
        self.defaultBlurRadius = 0
        self.defaultSaturationAmount = 0
        self.activateGlassMorphism = false
        self.isViewDisplayed = false
        self.topPadding = UIScreen.main.bounds.height / 12
        self.screenHeight = UIScreen.main.bounds.height / 1.2
        self.horizontalPadding = 20
        self.cornerRadius = 25
    }
}
