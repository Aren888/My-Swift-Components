//
//  HomeView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 22.01.24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State var blurView: UIVisualEffectView = .init()
    
    var body: some View {
        ZStack {
            HomeBackgroundCirclesView()
            
            VStack {
                HomeGlassMorphismView(
                    viewModel: viewModel,
                    blurView: blurView
                )
                Spacer()
            }
        }
        .ignoresSafeArea()
        .background(Color(.red.withAlphaComponent(0.1)))
    }
}

#Preview {
    ThreadsTabView()
}
