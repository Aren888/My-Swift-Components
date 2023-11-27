//
//  ContentView.swift
//  PageCurlSwipeAnimation
//
//  Created by Solicy Ios on 27.11.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .navigationTitle("Peel Effect")
        }
    }
}

#Preview {
    ContentView()
}
