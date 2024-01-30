//
//  CustomBlurView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 31.01.24.
//

import SwiftUI

// MARK: - Custom Blur View
struct CustomBlurView: UIViewRepresentable {
    var effect: UIBlurEffect.Style
    var onChange: (UIVisualEffectView) -> ()
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: effect))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        DispatchQueue.main.async {
            onChange(uiView)
        }
    }
}

// MARK: - UIVisualEffectView Extensions
extension UIVisualEffectView {
    // Backdrop Property
    var backDrop: UIView? {
        return subView(forClass: NSClassFromString("_UIVisualEffectBackdropView"))
    }
    
    // Gaussian Blur Property
    var gaussianBlur: NSObject? {
        return backDrop?.value(key: "filters", filter: "gaussianBlur")
    }
    
    // Saturation Property
    var saturation: NSObject? {
        return backDrop?.value(key: "filters", filter: "colorSaturate")
    }
    
    // Gaussian Blur Radius Property
    var gaussianBlurRadius: CGFloat {
        get {
            return gaussianBlur?.values?["inputRadius"] as? CGFloat ?? 0
        }
        set {
            gaussianBlur?.values?["inputRadius"] = newValue
            applyNewEffects()
        }
    }
    
    // Apply New Effects
    func applyNewEffects() {
        UIVisualEffectView.animate(withDuration: 2) {
            self.backDrop?.perform(Selector(("applyRequestedFilterEffects")))
        }
    }
    
    // Saturation Amount Property
    var saturationAmount: CGFloat {
        get {
            return saturation?.values?["inputAmount"] as? CGFloat ?? 0
        }
        set {
            saturation?.values?["inputAmount"] = newValue
            applyNewEffects()
        }
    }
}

// MARK: - UIView Extensions
extension UIView {
    // Subview for Class
    func subView(forClass: AnyClass?) -> UIView? {
        return subviews.first { view in
            type(of: view) == forClass
        }
    }
}

// MARK: - NSObject Extensions
extension NSObject {
    // Values Property
    var values: [String : Any]? {
        get {
            return value(forKeyPath: "requestedValues") as? [String: Any]
        }
        set {
            return setValue(newValue, forKeyPath: "requestedValues")
        }
    }
    
    // Get Value by Key and Filter
    func value(key: String, filter: String) -> NSObject? {
        (value(forKey: key) as? [NSObject])?.first(where: { obj in
            return obj.value(forKeyPath: "filterType") as? String == filter
        })
    }
}
