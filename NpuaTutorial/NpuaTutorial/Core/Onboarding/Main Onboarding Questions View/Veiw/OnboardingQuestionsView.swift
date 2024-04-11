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
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Next")
            case 1:
                SecondQuestionView()
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Proceed")
            case 2:
                ThirdQuestionView()
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Advance")
            case 3:
                FourthQuestionView()
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Move On")
            case 4:
                FifthQuestionView()
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Next Step")
            case 5:
                SixthQuestionView()
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Continue Forward")
            case 6:
                FinishQuestionView()
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Get Started", isPresentingLoginView: true)
            default:
                EmptyView()
            }
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
