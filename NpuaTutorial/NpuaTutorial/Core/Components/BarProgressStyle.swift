//
//  BarProgressStyle.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

struct BarProgressStyle: ProgressViewStyle {
    
    var color: Color = .black
    var height: Double = 20.0
    var labelFontStyle: Font = .body
    
    func makeBody(configuration: Configuration) -> some View {
        
        let progress = configuration.fractionCompleted ?? 0.0
        
        GeometryReader { geometry in
            
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color(uiColor: .systemGray5))
                .frame(height: height)
                .frame(width: geometry.size.width)
                .overlay(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(color)
                        .frame(width: geometry.size.width * progress)
                        .overlay {
                            if let currentValueLabel = configuration.currentValueLabel {
                                
                                currentValueLabel
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                }
        }
    }
}
