//
//  SixthQuestionView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 07.04.24.
//

import SwiftUI

struct SixthQuestionView: View {
    
    @StateObject var viewModel = SixthQuestionViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("ai-model-image-6")
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
                        
                        HStack() {
                            VStack {
                                Image(systemName: viewModel.sections[index].2)
                                    .foregroundStyle(viewModel.selectedButtonIndex == index ? viewModel.buttonMessageBGColor.gradient : viewModel.buttonBGColor.gradient)
                                    .frame(width: 20)
                            }
                            .padding(4)
                            
                            VStack(alignment: .leading) {
                                Text(viewModel.sections[index].0)
                                    .foregroundStyle(viewModel.selectedButtonIndex == index ? viewModel.buttonMessageBGColor.gradient : viewModel.buttonBGColor.gradient)
                                    .fontWeight(.bold)
                                    .lineLimit(2)
                                
                                Text(viewModel.sections[index].1)
                                    .foregroundStyle(viewModel.selectedButtonIndex == index ? viewModel.buttonMessageBGColor.gradient : viewModel.buttonBGColor.gradient)
                                    .lineLimit(2)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                        .frame(maxWidth: .infinity)
                        .background(.white.gradient)
                        .cornerRadius(16)
                        .shadow(radius: 2)
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
