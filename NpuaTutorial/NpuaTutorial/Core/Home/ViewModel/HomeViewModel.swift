//
//  HomeViewModel.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 22.01.24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var draggingItem: Color?
    @Published var colors: [Color] = [
        Color.random(),
        Color.random(),
        Color.random(),
        Color.random(),
        Color.random(),
        Color.random(),
        Color.random(),
        Color.random(),
        Color.random(),
        Color.random()
    ]
}
