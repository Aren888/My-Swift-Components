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
        NavigationView {
            
            ZStack {
                HomeBackgroundCirclesView()
                
                VStack {
                    HomeGlassMorphismView(
                        viewModel: viewModel,
                        blurView: blurView
                    )
                    Spacer()
                }
                .commonStyle(viewModel: viewModel)
                VStack {
                    HStack(spacing: 0) {
                        ZStack {
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
                                        .white.opacity(1),
                                        .clear,
                                        .purple.opacity(0.5),
                                        .purple.opacity(1)
                                    ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 5
                                )
                            
                            NavigationLink("Show Detail View", destination: TodoView())
                                .font(.system(size: 16, weight: .bold, design: .monospaced))
                                .tint(.black)
                        }
                        .frame(width: 200, height: 100)
                        .foregroundStyle(.black.gradient)
                        .background(.purple.opacity(0.1))
                        .cornerRadius(25)
                        .padding()
                        
                        Spacer()
                    }
                    Spacer()
                }
                .commonStyle(viewModel: viewModel)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ThreadsTabView()
}
