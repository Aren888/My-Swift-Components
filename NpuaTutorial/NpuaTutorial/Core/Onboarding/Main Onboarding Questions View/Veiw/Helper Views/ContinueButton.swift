//
//  ContinueButton.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

struct ContinueButton: View {
    
    @ObservedObject var viewModel: OnboardingQuestionsViewModel
    @State var buttonTitle: String
    @State var isPresentingLoginView: Bool = false
    
    var body: some View {
        if !isPresentingLoginView {
            Button(action: {
                viewModel.increaseProgress()
                withAnimation(.easeInOut) {
                    viewModel.increaseViewCount()
                }
            }) {
                Text(buttonTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background {
                        Capsule()
                            .fill(Color.white.gradient)
                            .shadow(radius: 10)
                    }
            }
        } else {
            NavigationLink(destination: LoginView()) {
                Text(buttonTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background {
                        Capsule()
                            .fill(Color.white.gradient)
                            .shadow(radius: 10)
                    }
            }
        }
    }
}

#Preview {
    OnboardingQuestionsView()
}
