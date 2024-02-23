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
            NavigationLink(destination: TodoView()) {
                
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
                    
                    HStack {
                        VStack {
                            Text("Organize your work")
                            Text("and life, finally.")
                        }
                        
                        Spacer()
                        Image(systemName: "list.bullet.clipboard")
                            .resizable()
                            .scaledToFit()
                            .frame( height: 30)
                    }
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .font(.system(size: 18, weight: .semibold, design: .monospaced))
                    .shadow(color: .white, radius: 1, x: 1.0, y: 1.0)
                    .padding()
                    .padding(.horizontal)
                }
            }
             
        }
    
}



#Preview {
    ThreadsTabView()
}
