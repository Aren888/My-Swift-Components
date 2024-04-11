//
//  FinishQuestionView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 11.04.24.
//

import SwiftUI

struct FinishQuestionView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("ai-model-image-1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            Text("Thank you for answering all the questions, we really appreciate it. Let's start learning together.")
                .fontWeight(.bold)
                .foregroundStyle(.white.gradient)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .padding(.horizontal)
                .background {
                    Rectangle()
                        .fill(.gray.gradient)
                        .cornerRadius(15)
                        .shadow(radius: 15)
                }
            
            Spacer()
            
        }
    }
}

#Preview {
    OnboardingQuestionsView()
}
