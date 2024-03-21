//
//  IntroViewHelper.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

struct IntroViewHelper<Actionview: View>: View {
    @Binding var intro: PageIntro
    var size: CGSize
    var actionView: Actionview
    
    init(intro: Binding<PageIntro>, size: CGSize, @ViewBuilder actionView: @escaping () -> Actionview) {
        self._intro = intro
        self.size = size
        self.actionView = actionView()
    }
    
    @State private var showView: Bool = false
    @State private var hideWholeView: Bool = false
    
    var body: some View {
        VStack {
            // Display onboarding page image
            GeometryReader {
                let size = $0.size
                
                Image(intro.introAssertImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: size.width, height: size.height)
            }
            .offset(y: showView ? 0 : -size.height / 2)
            .opacity(showView ? 1 : 0)
            .padding(50)
            
            VStack(alignment: .leading, spacing: 10) {
                Spacer(minLength: 0)
                // Display onboarding page title and subtitle
                Text(intro.title)
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Text(intro.subTitle)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 15)
                
                if !intro.displaysAction {
                    // Display progress indicator and Next button
                    Group {
                        Spacer(minLength: 25)
                        
                        CustomIndicatorView(totalPages: filteredPages.count, currentPage: filteredPages.firstIndex(of: intro) ?? 0)
                            .frame(maxWidth: .infinity)
                        
                        Spacer(minLength: 10)
                        
                        Button {
                            changeIntro()
                        } label: {
                            Text("Next")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 15)
                                .background {
                                    Capsule()
                                        .fill(.black.gradient)
                                        .shadow(radius: 10)
                                }
                        }
                        .frame(maxWidth: .infinity)
                    }
                } else {
                    // Display custom action view
                    actionView
                        .offset(y: showView ? 0 : size.height / 2)
                        .opacity(showView ? 1 : 0)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .offset(y: showView ? 0 : size.height / 2)
            .opacity(showView ? 1 : 0)
        }
        .offset(y: hideWholeView ? size.height / 2 : 0)
        .opacity(hideWholeView ? 0 : 1)
        .overlay(alignment: .topLeading) {
            // Display back button if not on the first page
            if intro != pageIntros.first {
                Button {
                    changeIntro(true)
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 25, height: 25)
                }
                .padding(10)
                .offset(y: showView ? 0 : -200)
                .offset(y: hideWholeView ? -200 : 0)
            }
        }
        .onAppear {
            showView = true
        }
    }
    
    // Change to the next or previous onboarding page
    func changeIntro(_ isPrevious: Bool = false) {
        // Hide the IntroView with animation
        withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)) {
            hideWholeView = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Change to the next or previous page
            if let index = pageIntros.firstIndex(of: intro), (isPrevious ? index != 0 : index != pageIntros.count - 1) {
                intro = isPrevious ?  pageIntros[index - 1] : pageIntros[index + 1]
            } else {
                intro =  isPrevious ? pageIntros[0] : pageIntros[pageIntros.count - 1]
            }
            
            // Show the IntroView with animation
            hideWholeView = false
            showView = false
            
            withAnimation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0).delay(0.1)) {
                showView = true
            }
        }
    }
    
    // Filter out pages that display custom action views
    var filteredPages: [PageIntro] {
        return pageIntros.filter { !$0.displaysAction }
    }
}

#Preview {
    ContentView()
}
