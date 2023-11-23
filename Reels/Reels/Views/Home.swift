//
//  Home.swift
//  Reels
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

// MARK: - Home View

/// The main view displaying Reels and additional UI elements.
struct Home: View {
    
    // MARK: Properties
    
    var size: CGSize
    var safeArea: EdgeInsets
    
    // State variables to manage the reels and liked counters.
    @State private var reels: [Reel] = reelsData
    @State private var likedCounter: [Like] = []
    
    // MARK: Body
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach($reels) { $reel in
                    // Display individual Reel views.
                    ReelView(
                        reel: $reel,
                        likedCounter: $likedCounter,
                        size: size,
                        safeArea: safeArea
                    )
                    .frame(maxWidth: .infinity)
                    .containerRelativeFrame(.vertical)
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
        .background(.black)
        .overlay(alignment: .topLeading, content: {
            // Display liked counter animations.
            ZStack {
                ForEach(likedCounter) { like in
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 75))
                        .foregroundStyle(.red.gradient)
                        .frame(width: 100, height: 100)
                        .animation(.smooth, body: { view in
                            view
                                .scaleEffect(like.isAnimated ? 1 : 1.8)
                                .rotationEffect(.init(degrees: like.isAnimated ? 0 : .random(in: -30...30)))
                        })
                        .offset(x: like.tappedRect.x - 50, y: like.tappedRect.y - 50)
                        .offset(y: like.isAnimated ? -(like.tappedRect.y + safeArea.top) : 0)
                }
            }
        })
        .overlay(alignment: .top, content: {
            // Display the title and camera button.
            Text("Reels")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .trailing) {
                    Button("", systemImage: "camera") {
                        // Action for the camera button.
                    }
                    .font(.title2)
                }
                .foregroundStyle(.white)
                .padding(.top, safeArea.top + 15)
                .padding(.horizontal, 15)
        })
        .environment(\.colorScheme, .dark)
    }
}

// MARK: - Preview

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
