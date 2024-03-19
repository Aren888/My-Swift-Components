//
//  FirstQuestionView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 19.03.24.
//

import SwiftUI

struct FirstQuestionView: View {
    
    @StateObject var viewModel = FirstQuestionViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("ai-model-image")
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
            
            HStack {
                Text(viewModel.title)
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.top)
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
                                Text(viewModel.sections[index].flag)
                                    .font(.largeTitle)
                                Text(viewModel.sections[index].language)
                                    .foregroundStyle(viewModel.selectedButtonIndex == index ? viewModel.buttonMessageBGColor.gradient : viewModel.buttonBGColor.gradient)
                                Spacer()
                            }
                        }
                        .padding(2)
                        .padding(.horizontal)
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
