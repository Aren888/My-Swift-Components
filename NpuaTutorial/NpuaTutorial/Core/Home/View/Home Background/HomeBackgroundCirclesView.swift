//
//  HomeBackgroundCirclesView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 31.01.24.
//

import SwiftUI

struct HomeBackgroundCirclesView: View {
    var body: some View {
        ZStack {
            CircleView(gradientColors: [.color7.opacity(0.4), .color8.opacity(0.4)], size: 400, offset: CGSize(width: 250, height: 400))
            CircleView(gradientColors: [.color5.opacity(0.4), .color6.opacity(0.4)], size: 200, offset: CGSize(width: -200, height: -250))
            CircleView(gradientColors: [.color1.opacity(0.4), .color2.opacity(0.4)], size: 400, offset: CGSize(width: -180, height: 400))
            CircleView(gradientColors: [.color3.opacity(0.4), .color4.opacity(0.4)], size: 160, offset: CGSize(width: -150, height: 60))
            CircleView(gradientColors: [.color5.opacity(0.4), .color6.opacity(0.4)], size: 200, offset: CGSize(width: 150, height: 100))
            CircleView(gradientColors: [.color7.opacity(0.4), .color8.opacity(0.4)], size: 300, offset: CGSize(width: 100, height: -300))
            CircleView(gradientColors: [.color1.opacity(0.4), .color2.opacity(0.4)], size: 120, offset: CGSize(width: 20, height: -70))
        }
    }
}

#Preview {
    ThreadsTabView()
}
