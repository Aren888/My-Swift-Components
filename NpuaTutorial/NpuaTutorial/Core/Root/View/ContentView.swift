//
//  ContentView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 30.11.23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NpuaTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}


