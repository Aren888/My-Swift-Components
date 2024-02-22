//
//  TodoButton.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 22.02.24.
//

import SwiftUI

struct TodoButton: View {
    
    @Binding var blurView: UIVisualEffectView
    @Binding var cornerRadius: CGFloat
    @Binding var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            HomeGlassMorphismView(viewModel: viewModel, blurView: blurView)
                .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height / 8, maxHeight: .infinity)
            
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        .purple.opacity(0.25),
                        .purple.opacity(0.25)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .blur(radius: 5)
                .padding()
            
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(colors: [
                        .purple.opacity(1),
                        .clear,
                        .white.opacity(0.5),
                        .white.opacity(1)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1
                )
                .padding()
            
            NavigationLink("My MultiFunctional Todo", destination: TodoView())
                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                .tint(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
            
        }
    }
}


#Preview {
    ThreadsTabView()
}
