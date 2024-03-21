//
//  StartOnboardingView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 12.03.24.
//

import SwiftUI

struct StartOnboardingView: View {
    
    @StateObject private var viewModel: StartOnboardingViewModel = StartOnboardingViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 8) {
                
                Image("ai-model-image-1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Text(viewModel.welcomeMessage)
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .padding(.top)
                
                if viewModel.isShowQuestionMessage {
                    Text(viewModel.questionMessage)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(14)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.black.gradient)
                        }
                        .padding(.vertical, 15)
                }
            }
            .padding()
            .padding(.horizontal)
            
            Spacer()
            Spacer()
            
            Button {
                withAnimation {
                    viewModel.isShowQuestionMessage.toggle()
                }
            } label: {
                Text(viewModel.continueButtonTitle)
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
        .onChange(of: viewModel.isShowQuestionMessage, { oldValue, newValue in
            if !newValue {
                viewModel.isPushQuestionsView = true
            }
        })
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 25, height: 25)
            }
            .padding(12)
        }
        .navigationDestination(isPresented: $viewModel.isPushQuestionsView) {
            OnboardingQuestionsView()
            
            Text("")
                .hidden()
            
        }
        .padding()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    NavigationView {
        StartOnboardingView()
    }
}
