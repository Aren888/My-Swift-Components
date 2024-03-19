//
//  FirstQuestionView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 19.03.24.
//

import SwiftUI

struct FirstQuestionView: View {
    
    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Image("ai-model-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                
                Text("What Would You Like To Learn?")
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
                Text("For English speakers")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                Spacer()
            }
            
            ScrollView(showsIndicators: false) {
                
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingQuestionsView()
}
