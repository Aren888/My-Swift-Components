//
//  LoadingView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 14.04.24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(1.5)
            Text("Loading...")
                .foregroundColor(.gray)
                .padding(.top, 15)
        }
        .padding(20)
        .background(Color.white.opacity(0.5))
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}
