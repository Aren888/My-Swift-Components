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
                FirstQuestionView(onboardingViewModel: viewModel)
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Next", isContinueButtonEnabled: $viewModel.isContinueButtonEnabled)
            case 1:
                SecondQuestionView(onboardingViewModel: viewModel)
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Proceed", isContinueButtonEnabled: $viewModel.isContinueButtonEnabled)
            case 2:
                ThirdQuestionView(onboardingViewModel: viewModel)
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Advance", isContinueButtonEnabled: $viewModel.isContinueButtonEnabled)
            case 3:
                FourthQuestionView(onboardingViewModel: viewModel)
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Move On", isContinueButtonEnabled: $viewModel.isContinueButtonEnabled)
            case 4:
                FifthQuestionView(onboardingViewModel: viewModel)
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Next Step", isContinueButtonEnabled: $viewModel.isContinueButtonEnabled)
            case 5:
                SixthQuestionView()
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Continue Forward", isContinueButtonEnabled: .constant(true))
            case 6:
                FinishQuestionView()
                Spacer()
                ContinueButton(viewModel: viewModel, buttonTitle: "Go To Learn!", isPresentingLoginView: true, isContinueButtonEnabled: .constant(true))
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
