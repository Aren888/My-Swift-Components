//
//  HomeGlassMorphismView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 31.01.24.
//

import SwiftUI

struct HomeGlassMorphismView: View {
    
    @StateObject var viewModel: HomeViewModel
    @State var blurView: UIVisualEffectView
    
    var body: some View {
        ZStack {
            CustomBlurView(effect: .systemUltraThinMaterial) { view in
                blurView = view
                
                if viewModel.defaultBlurRadius == 0 { viewModel.defaultBlurRadius = view.gaussianBlurRadius }
                if viewModel.defaultSaturationAmount == 0 { viewModel.defaultSaturationAmount = view.saturationAmount}
            }
            .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius, style: .continuous))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeInOut(duration: 3)) {
                        viewModel.activateGlassMorphism = true
                        blurView.gaussianBlurRadius = (viewModel.activateGlassMorphism ? 1 : viewModel.defaultBlurRadius)
                        blurView.saturationAmount = (viewModel.activateGlassMorphism ? 15 : viewModel.defaultSaturationAmount)
                    }
                }
            }
            
            RoundedRectangle(cornerRadius: viewModel.cornerRadius, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        .white.opacity(0.25),
                        .white.opacity(0.25)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .blur(radius: 5)
            
            RoundedRectangle(cornerRadius: viewModel.cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(colors: [
                        .white.opacity(0.6),
                        .clear,
                        .purple.opacity(0.2),
                        .purple.opacity(0.5)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2
                )
        }
        .shadow(color: .black.opacity(0.25), radius: 15, x: -15, y: 15)
        .shadow(color: .black.opacity(0.25), radius: 15, x: 15, y: -15)
    }
}

#Preview {
    ThreadsTabView()
}
