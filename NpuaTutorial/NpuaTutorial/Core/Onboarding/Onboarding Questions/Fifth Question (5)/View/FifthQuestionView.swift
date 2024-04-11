//
//  FifthQuestionView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 07.04.24.
//

import SwiftUI

struct FifthQuestionView: View {
    
    @StateObject var viewModel = FifthQuestionViewModel()

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("ai-model-image-5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                
                Text(viewModel.question)
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .padding(.horizontal, 4)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.black.gradient)
                    }
                
                Spacer()
            }
            
            VStack {
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.sections.indices, id: \.self) { index in
                        Button {
                            withAnimation {
                                viewModel.selectedButtonIndex = index
                            }
                        } label: {
                            HStack() {
                                Text(viewModel.sections[index].0)
                                    .foregroundStyle(viewModel.selectedButtonIndex == index ? viewModel.buttonMessageBGColor.gradient : viewModel.buttonBGColor.gradient)
                                
                                Spacer()
                                
                                Text(viewModel.sections[index].1)
                                    .foregroundStyle(viewModel.selectedButtonIndex == index ? viewModel.buttonMessageBGColor.gradient : viewModel.buttonBGColor.gradient)
                                    .font(.system(size: 14))
                            }
                        }
                        .padding(2)
                        .padding(.horizontal)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(
                            Capsule()
                                .fill(viewModel.selectedButtonIndex == index ? viewModel.buttonBGColor.gradient :  viewModel.buttonMessageBGColor.gradient)
                                .shadow(radius: 10)
                        )
                    }
                    .padding()
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    OnboardingQuestionsView()
}
