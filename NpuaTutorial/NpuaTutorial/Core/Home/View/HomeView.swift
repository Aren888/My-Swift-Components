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
                VStack(spacing: 0) {
                    
                    TodoButton(blurView: $blurView, cornerRadius: .constant(10), viewModel: Binding.constant(viewModel))

                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.indexSections, id: \.self) { value in
                            
                            ZStack{
                                HomeGlassMorphismView(viewModel: viewModel, blurView: blurView)
                                    .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height / 10, maxHeight: .infinity)
                                     
                                
                                NavigationLink("\(viewModel.indexSectionsTitles[value]) \(value).") {
                                    
                                    MainGameView()
                                }
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                .font(.system(size: 18, weight: .semibold, design: .monospaced))
                                .shadow(color: .white, radius: 1, x: 1.0, y: 1.0)
                                .padding()
                                .padding(.horizontal, 26)
                                
                            }
                            
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: viewModel.cornerRadius, style: .continuous))
                    .shadow(color: .black.opacity(0.25), radius: 15, x: -15, y: 15)
                    .shadow(color: .black.opacity(0.25), radius: 15, x: 15, y: -15)
                    Spacer()
                }
                .commonStyle(viewModel: viewModel)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    TabsView()
}
