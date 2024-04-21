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
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.indexSections, id: \.self) { value in
                            
                            if value == 1 {
                                TodoButton(blurView: $blurView, cornerRadius: $viewModel.cornerRadius, viewModel: Binding.constant(viewModel))
                            } else {
                                HomeGlassMorphismView(viewModel: viewModel, blurView: blurView)
                                    .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height / 8, maxHeight: .infinity)
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
