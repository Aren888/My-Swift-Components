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
    @Published var bottomPadding: CGFloat
    @Published var screenHeight: CGFloat
    @Published var horizontalPadding: CGFloat
    @Published var cornerRadius: CGFloat
    @Published var isPresentingTodoView: Bool
    
    @Published var indexSections: [Int]
    @Published var indexSectionsTitles: [String]
    
    init() {
        self.defaultBlurRadius = 0
        self.defaultSaturationAmount = 0
        self.activateGlassMorphism = false
        self.isViewDisplayed = false
        self.isPresentingTodoView = false
        self.topPadding = UIScreen.main.bounds.height / 12
        self.bottomPadding = UIScreen.main.bounds.height / 8
        self.screenHeight = UIScreen.main.bounds.height
        self.horizontalPadding = 20
        self.cornerRadius = 25
        self.indexSections = Array(stride(from: 1, through: 20, by: 1))
        self.indexSectionsTitles = [
            "Embark on your Game Development journey with Level",
            "Dive into Game Development by starting with Level",
            "Take your first step into Game Development with Level",
            "Begin your exploration of Game Development with Level",
            "Kick off your Game Development adventure with Level",
            "Start your Game Development learning with Level",
            "Initiate your Game Development journey with Level",
            "Commence your Game Development education with Level",
            "Launch into Game Development by tackling Level",
            "Get started on Game Development with Level",
            "Step into the world of Game Development with Level",
            "Enter the realm of Game Development with Level",
            "Embark on your Game Development quest with Level",
            "Set sail on your Game Development voyage with Level",
            "Begin your Game Development expedition with Level",
            "Start your journey through Game Development with Level",
            "Take your first leap into Game Development with Level",
            "Open the door to Game Development with Level",
            "Unveil the secrets of Game Development with Level",
            "Unlock the mysteries of Game Development with Level",
            "Dive into Game Development by starting with Level"
        ]
    }
}
