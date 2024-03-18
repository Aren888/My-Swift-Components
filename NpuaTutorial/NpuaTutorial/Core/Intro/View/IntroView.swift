//
//  IntroView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import SwiftUI

struct IntroView: View {
    
    @StateObject var viewModel = IntroViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader {
                let size = $0.size
                
                IntroViewHelper(intro: $viewModel.activeIntro, size: size) {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Spacer(minLength: 0)
                        
                        SignInSectionView(
                            title: $viewModel.SignInTitle,
                            subTitle: $viewModel.SignInSubTitle,
                            buttonTitle: $viewModel.SignInButtonTitle
                        )
                        
                        GetStartedSectionView(
                            title: $viewModel.getStartedTitle,
                            subTitle: $viewModel.getStartedSubTitle,
                            buttonTitle: $viewModel.getStartedButtonTitle
                        )
                    }
                    .padding(.top, 25)
                }
            }
            .padding(15)
            .offset(y: -viewModel.keyboardHeight)
            .ignoresSafeArea(.keyboard, edges: .all)
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { output in
                if let info = output.userInfo, let height = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
                    viewModel.keyboardHeight = height
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                viewModel.keyboardHeight = 0
            }
            .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0), value: viewModel.keyboardHeight)
        }
    }
}

#Preview {
    ContentView()
}
