//
//  CircleView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 31.01.24.
//

import SwiftUI

// MARK: - Circle View
struct CircleView: View {
    let gradientColors: [Color]
    let size: CGFloat
    let offset: CGSize
    
    var body: some View {
        Circle()
            .fill(LinearGradient(
                colors: gradientColors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            .frame(width: size, height: size)
            .offset(offset)
    }
}

#Preview {
    CircleView(gradientColors: [.color7.opacity(0.6), .color8.opacity(0.6)], size: 400, offset: CGSize(width: 250, height: 400))
}
