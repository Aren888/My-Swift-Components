//
//  ProgressHeaderView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

struct ProgressHeaderView: View {
    @ObservedObject var viewModel: OnboardingQuestionsViewModel
    var dismissAction: DismissAction
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 18) {
                Button(action: {
                    if viewModel.progressIndex >= 0.2 {
                        viewModel.decreaseProgress()
                    } else {
                        dismissAction()
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 25, height: 25)
                }
                
                ProgressView(value: viewModel.progressValue, label: {}, currentValueLabel: {
                    Text("\(viewModel.percent)%")
                })
                .progressViewStyle(BarProgressStyle(height: 40))
            }
            .frame(height: 40)
            .padding(12)
        }
    }
}

#Preview {
    OnboardingQuestionsView()
}
