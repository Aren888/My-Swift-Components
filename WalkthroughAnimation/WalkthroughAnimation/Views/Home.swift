//
//  Home.swift
//  WalkthroughAnimation
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

struct Home: View {
    // MARK: - Properties
    
    // Array of Intro structs representing onboarding screens
    @State private var intros: [Intro] = sampleIntros
    
    // Active intro displayed on the screen
    @State private var activeIntro: Intro?
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let safeArea = geometry.safeAreaInsets
            
            VStack(spacing: 0) {
                // Display the active onboarding intro
                if let activeIntro {
                    Rectangle()
                        .fill(activeIntro.bgColor)
                        .padding(.bottom, -30)
                        .overlay {
                            Circle()
                                .fill(activeIntro.circleColor)
                                .frame(width: 38, height: 38)
                                .background(alignment: .leading, content: {
                                    Capsule()
                                        .fill(activeIntro.bgColor)
                                        .frame(width: size.width)
                                })
                                .background(alignment: .leading) {
                                    Text(activeIntro.text)
                                        .font(.largeTitle)
                                        .foregroundStyle(activeIntro.textColor)
                                        .frame(width: textSize(activeIntro.text))
                                        .offset(x: 10)
                                        .offset(x: activeIntro.textOffset)
                                }
                                .offset(x: -activeIntro.circleOffset)
                        }
                }
                
                // Display login buttons
                LoginButtons()
                    .padding(.bottom, safeArea.bottom)
                    .padding(.top, 10)
                    .background(.black, in: .rect(topLeadingRadius: 25, topTrailingRadius: 25))
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 8)
            }
            .ignoresSafeArea()
        }
        .task {
            // Initialize the activeIntro and start the animation
            if activeIntro == nil {
                activeIntro = sampleIntros.first
                
                // Add delay before starting the animation
                let nanoSeconds = UInt64(1_000_000_000 * 0.5)
                try? await Task.sleep(nanoseconds: nanoSeconds)
                animate(0, true)
            }
        }
    }
    
    // MARK: - Login Buttons
    
    @ViewBuilder
    func LoginButtons() -> some View {
        VStack(spacing: 12) {
            // Apple login button
            Button {
                // TODO: Implement action for Apple login
            } label: {
                Label("Continue With Apple", systemImage: "applelogo")
                    .foregroundStyle(.black)
                    .fillButton(.white)
            }
            
            // Phone login button
            Button {
                // TODO: Implement action for Phone login
            } label: {
                Label("Continue With Phone", systemImage: "phone.fill")
                    .foregroundStyle(.white)
                    .fillButton(.button)
            }
            
            // Email sign-up button
            Button {
                // TODO: Implement action for Email sign-up
            } label: {
                Label("Sign Up With Email", systemImage: "envelope.fill")
                    .foregroundStyle(.white)
                    .fillButton(.button)
            }
            
            // Login button
            Button {
                // TODO: Implement action for general login
            } label: {
                Text("Login")
                    .foregroundStyle(.white)
                    .fillButton(.black)
                    .shadow(color: .white, radius: 1)
            }
        }
        .padding(15)
    }
    
    // MARK: - Animation
    
    // Animate through onboarding intros
    func animate(_ index: Int, _ loop: Bool = true) {
        if intros.indices.contains(index + 1) {
            activeIntro?.text = intros[index].text
            activeIntro?.textColor = intros[index].textColor
            
            withAnimation(.snappy(duration: 1),  completionCriteria: .removed) {
                activeIntro?.textOffset = -(textSize(intros[index].text) + 20)
                activeIntro?.circleOffset = -(textSize(intros[index].text) + 20) / 2
            } completion: {
                withAnimation(.snappy(duration: 0.8), completionCriteria: .logicallyComplete) {
                    activeIntro?.textOffset = 0
                    activeIntro?.circleOffset = 0
                    activeIntro?.circleColor = intros[index + 1].circleColor
                    activeIntro?.bgColor = intros[index + 1].bgColor
                } completion: {
                    animate(index + 1, loop)
                }
                
            }
        } else {
            if loop {
                animate(0, loop)
            }
        }
    }
    
    // MARK: - Text Size
    
    // Calculate the width of a text string
    func textSize(_ text: String) -> CGFloat {
        return NSString(string: text).size(withAttributes: [ .font: UIFont.preferredFont(forTextStyle: .largeTitle)]).width
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}

// MARK: - View Extension

extension View {
    // Fill button style extension
    @ViewBuilder
    func fillButton(_ color: Color) -> some View {
        self
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(color, in: .rect(cornerRadius: 15))
    }
}
