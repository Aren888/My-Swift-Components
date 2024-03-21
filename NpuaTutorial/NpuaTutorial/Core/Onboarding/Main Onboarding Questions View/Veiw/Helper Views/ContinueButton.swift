//
//  ContinueButton.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

struct ContinueButton: View {
    @ObservedObject var viewModel: OnboardingQuestionsViewModel
    
    var body: some View {
        Button(action: {
            viewModel.increaseProgress()
            withAnimation(.easeInOut) {
                viewModel.increaseViewCount()
            }
        }) {
            Text("Continue")
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

#Preview {
    OnboardingQuestionsView()
}
