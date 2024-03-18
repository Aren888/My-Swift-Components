//
//  StartOnboardingView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 12.03.24.
//

import SwiftUI

struct StartOnboardingView: View {
    
    @State private var isShowQuestionMessage: Bool = false
    @State private var isPushQuestionsView: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 8) {
                
                Image("ai-model-image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Text("Hi There! I'm Tong Ai.")
                    .font(.system(size: 18, weight: .medium, design: .serif))
                    .padding(.top)
                
                if isShowQuestionMessage {
                    Text("Just 7 quick questions before we begin your first lesson.")
                        .font(.system(size: 16, weight: .medium, design: .serif))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(14)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                                .shadow(radius: 10)
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
                    isShowQuestionMessage.toggle()
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
        .onChange(of: isShowQuestionMessage, { oldValue, newValue in
            if !newValue {
                isPushQuestionsView = true
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
        .navigationDestination(isPresented: $isPushQuestionsView) {
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
