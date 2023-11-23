//
//  ContentView.swift
//  CalendarScrollSync
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            
            Home(safeArea: safeArea)
                .ignoresSafeArea(.container, edges: .top)
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.white.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            
        )
    }
}

#Preview {
    ContentView()
}
