//
//  OnboardingQuestionsView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

struct OnboardingQuestionsView: View {
    
    @StateObject var viewModel = OnboardingQuestionsViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            VStack(spacing: 0) {
                HStack(spacing: 18) {
                    Button {
                        if viewModel.progressIndex >= 0.2 {
                            viewModel.progressIndex -= 0.1
                            withAnimation(.easeOut) {
                                viewModel.progressValue = (viewModel.progressIndex / 0.7)
                            }
                            viewModel.percent = Int(viewModel.progressIndex / 0.7 * 100)
                        } else {
                            dismiss()
                        }
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                    }
                    
                    ProgressView(value: (viewModel.progressValue), label: {}, currentValueLabel: {
                        Text("\(viewModel.percent)%")
                    })
                    .progressViewStyle(BarProgressStyle(height: 40))
                    
                }
                .frame(height: 40)
                .padding(12)
            }
            
            Spacer()
            
            Button {
                if viewModel.progressIndex < 0.7 {
                    viewModel.progressIndex += 0.1
                    withAnimation(.easeOut) {
                        viewModel.progressValue = (viewModel.progressIndex / 0.7)
                    }
                    viewModel.percent = Int(viewModel.progressIndex / 0.7 * 100)
                }
            } label: {
                Text("Continue")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background {
                        Capsule()
                            .fill(Color.white)
                            .shadow(radius: 10)
                    }
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.percent = Int(viewModel.progressIndex / 0.7 * 100)
            viewModel.progressValue = (viewModel.progressIndex / 0.7)
        }
    }
}

#Preview {
    OnboardingQuestionsView()
}
