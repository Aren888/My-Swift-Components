//
//  OnboardingQuestionsView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

struct OnboardingQuestionsView: View {
    @StateObject var viewModel = OnboardingQuestionsViewModel()
    @Environment(\.dismiss) var dismissAction: DismissAction
    
    var body: some View {
        VStack {
            ProgressHeaderView(viewModel: viewModel, dismissAction: dismissAction)
            
                switch viewModel.nextViewCount {
                case 0:
                    FirstQuestionView()
                case 1:
                    SecondQuestionView()
                case 2:
                    ThirdQuestionView()
                default:
                    EmptyView()
                }
            
            Spacer()
            ContinueButton(viewModel: viewModel)
        }
        .padding()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.updateProgress()
        }
    }
}

#Preview {
    OnboardingQuestionsView()
}
