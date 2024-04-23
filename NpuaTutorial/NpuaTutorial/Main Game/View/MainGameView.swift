//
//  MainGameView.swift
//  Tong Ai
//
//  Created by Solicy Office on 21.04.24.
//

import SwiftUI

struct MainGameView: View {
    
    @State private var showView: Bool = false
    @State private var showQuestionView: Bool = false
    @State private var isClickedAnswer: Bool = false
    @State private var selectedQuestion: String? = nil
    @State private var isTrueAnswer: Bool = false
    
    @State private var questions: [String] = [
        "Which planet is known as the 'Red Planet' ?",
        "Ո՞ր մոլորակն է հայտնի որպես «Կարմիր մոլորակ»:"
    ]
    
    @State private var answers: [(String, String)] = [
        ("Venus", "«Վեներա»"),
        ("Mars", "«Մարս»"),
        ("Jupiter", "«Յուպիտեր»"),
        ("Saturn", "«Սատուրն»"),
    ].shuffled()
    
    @State private var correctAnswer: String = "Mars"

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                ZStack {
                    if !showQuestionView {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(isClickedAnswer ? (isTrueAnswer ? Color.green.gradient : Color.red.gradient) : Color.purple.gradient)
                            .opacity(0.8)
                            .transition(.revertFlip)
                        
                        Text(questions[0])
                            .transition(.revertFlip)
                            .foregroundColor(.black)
                            .transition(.opacity)
                            .padding()
                    } else {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(isClickedAnswer ? (isTrueAnswer ? Color.green.gradient : Color.red.gradient) : Color.purple.gradient)
                            .opacity(0.8)
                            .transition(.flip)
                        
                        Text(questions[1])
                            .transition(.flip)
                            .foregroundColor(.black)
                            .transition(.opacity)
                            .padding()
                    }
                }
                .onTapGesture {
                    withAnimation(.bouncy(duration: 2)) {
                        showQuestionView.toggle()
                    }
                }
                .frame(width: 300, height: 200)
                .padding()
                
                Spacer()
                
                VStack {
                    HStack {
                        flipView(
                            isClickedAnswer: isClickedAnswer,
                            isTrueAnswer: correctAnswer == answers[0].0,
                            text: answers[0].0,
                            trueAnswerText: answers[0].1,
                            showView: showView,
                            answer: answers[0].0
                        )
                        
                        flipView(
                            isClickedAnswer: isClickedAnswer,
                            isTrueAnswer: correctAnswer == answers[1].0,
                            text: answers[1].0,
                            trueAnswerText: answers[1].1,
                            showView: showView,
                            answer: answers[1].0
                        )
                    }
                 
                    HStack {
                        flipView(
                            isClickedAnswer: isClickedAnswer,
                            isTrueAnswer: correctAnswer == answers[2].0,
                            text: answers[2].0,
                            trueAnswerText: answers[2].1,
                            showView: showView,
                            answer: answers[2].0
                        )
                        
                        flipView(
                            isClickedAnswer: isClickedAnswer,
                            isTrueAnswer: correctAnswer == answers[3].0,
                            text: answers[3].0,
                            trueAnswerText: answers[3].1,
                            showView: showView,
                            answer: answers[3].0
                        )
                    }
                }
                .onTapGesture {
                    withAnimation(.bouncy(duration: 2)) {
                        showView.toggle()
                        isClickedAnswer.toggle()
                        
                    }
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding()
                
                Spacer()
                
            }
            .background((isClickedAnswer ? (isTrueAnswer ? Color.green.gradient : Color.red.gradient) : Color.purple.gradient).opacity(0.5))
        }
    }
    
    func checkAnswer(selectedAnswer: String) {
        isClickedAnswer = true
        isTrueAnswer = selectedAnswer == correctAnswer
    }
    
    
    func flipView(isClickedAnswer: Bool, isTrueAnswer: Bool, text: String, trueAnswerText: String, showView: Bool, answer: String) -> some View {
        ZStack {
            if !showView {
                RoundedRectangle(cornerRadius: 25)
                    .fill(isClickedAnswer ? (isTrueAnswer ? Color.green.gradient : Color.red.gradient) : Color.purple.gradient)
                    .opacity(0.8)
                    .transition(.revertFlip)
                
                Text(text)
                    .transition(.revertFlip)
                    .foregroundColor(.black)
                    .transition(.opacity)
                    .padding()
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(isClickedAnswer ? (isTrueAnswer ? Color.green.gradient : Color.red.gradient) : Color.purple.gradient)
                    .opacity(0.8)
                    .transition(.flip)
                
                Text(trueAnswerText)
                    .transition(.flip)
                    .foregroundColor(.black)
                    .transition(.opacity)
                    .padding()
            }
        }
        .onTapGesture {
            withAnimation(.bouncy(duration: 2)) {
                if !isClickedAnswer {
                    self.showView.toggle()
                    checkAnswer(selectedAnswer: answer)
                }
            }
        }
    }
}

struct FlipTransition: ViewModifier, Animatable {
    
    var progress: CGFloat = 0
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(progress < 0 ? (-progress < 0.5 ? 1 : 0) : progress < 0.5 ? 1 : 0)
            .rotation3DEffect(
                .init(degrees: progress * 180),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
    }
}

extension AnyTransition {
    static let flip: AnyTransition = .modifier(
        active: FlipTransition(progress: -1), identity: FlipTransition()
    )
    static let revertFlip: AnyTransition = .modifier(
        active: FlipTransition(progress: 1), identity: FlipTransition()
    )
}

#Preview {
    MainGameView()
}
