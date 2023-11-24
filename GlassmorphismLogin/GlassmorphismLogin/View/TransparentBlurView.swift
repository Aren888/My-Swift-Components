//
//  TransparentBlurView.swift
//  GlassmorphismLogin
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

// MARK: - TransparentBlurView

struct TransparentBlurView: UIViewRepresentable {
    var removeAllFilters: Bool = false
    
    // MARK: - UIViewRepresentable
    
    func makeUIView(context: Context) -> TransparentBlurViewHelper {
        return TransparentBlurViewHelper(removeAllFilters: removeAllFilters)
    }
    
    func updateUIView(_ uiView: TransparentBlurViewHelper, context: Context) {
        // No update needed for now
    }
}

// MARK: - TransparentBlurViewHelper

class TransparentBlurViewHelper: UIVisualEffectView {
    
    // MARK: - Initialization
    
    init(removeAllFilters: Bool) {
        super.init(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        
        // Adjust subviews for transparency
        if subviews.indices.contains(1) {
            subviews[1].alpha = 0
        }
        
        // Adjust filters based on removeAllFilters flag
        if let backdropLayer = layer.sublayers?.first {
            if removeAllFilters {
                backdropLayer.filters = []
            } else {
                backdropLayer.filters?.removeAll { filter in
                    String(describing: filter) != "gaussianBlur"
                }
            }
        }
    }
    
    // MARK: - Required
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Trait Collection Change
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        // Handle trait collection change if needed
    }
}

// MARK: - Preview

#Preview {
    TransparentBlurView()
        .padding(15)
}
