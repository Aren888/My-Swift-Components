//
//  Home.swift
//  BlurCards
//
//  Created by Solicy Ios on 24.11.23.
//

import SwiftUI

struct Home: View {
    // MARK: - State Variables
    @State var blurView: UIVisualEffectView = .init()
    @State var defaultBlurRadius: CGFloat = 0
    @State var defaultSaturationAmount: CGFloat = 0
    
    @State var activateGlassMorphism: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Background
            Color("BG")
                .ignoresSafeArea()
            
            // Circles
            CircleView(gradientColors: [.color1, .color2], size: 300, offset: CGSize(width: -40, height: 400))
            CircleView(gradientColors: [.color3, .color4], size: 160, offset: CGSize(width: -150, height: 60))
            CircleView(gradientColors: [.color5, .color6], size: 200, offset: CGSize(width: 150, height: 100))
            CircleView(gradientColors: [.color7, .color8], size: 300, offset: CGSize(width: 100, height: -300))
            CircleView(gradientColors: [.color9, .color10], size: 80, offset: CGSize(width: 50, height: -90))
            
            // Glass Morphic Card
            GlassMorphicCard()
            
            // Toggle for Glass Morphism Activation
            Toggle("Activate Glass Morpism", isOn: $activateGlassMorphism)
                .font(.title3)
                .fontWeight(.semibold)
                .onChange(of: activateGlassMorphism, { oldValue, newValue in
                    blurView.gaussianBlurRadius = (activateGlassMorphism ? 10 : defaultBlurRadius)
                    blurView.saturationAmount = (activateGlassMorphism ? 1.8 : defaultSaturationAmount)
                })
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(15)
        }
    }
    
    // MARK: - Glass Morphic Card
    @ViewBuilder
    func GlassMorphicCard() -> some View  {
        ZStack {
            // Custom Blur View
            CustomBlurView(effect: .systemUltraThinMaterial) { view in
                blurView = view
                if defaultBlurRadius == 0 { defaultBlurRadius = view.gaussianBlurRadius }
                if defaultSaturationAmount == 0 { defaultSaturationAmount = view.saturationAmount}
            }
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            
            // Overlay Shapes
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        .white.opacity(0.25),
                        .white.opacity(0.25)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .blur(radius: 5)
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(
                    .linearGradient(colors: [
                        .white.opacity(0.6),
                        .clear,
                        .purple.opacity(0.2),
                        .purple.opacity(0.5)
                    ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2
                )
        }
        .shadow(color: .black.opacity(0.15), radius: 5, x: -10, y: 10)
        .shadow(color: .black.opacity(0.15), radius: 5, x: 10, y: -10)
        .overlay(content: {
            // Card Content
            CardContent()
                .opacity(activateGlassMorphism ? 1 : 0)
                .animation(.easeIn(duration: 0.5), value: activateGlassMorphism)
        })
        .padding(.horizontal, 25)
        .frame(height: 220)
    }
    
    // MARK: - Card Content
    @ViewBuilder
    func CardContent() -> some View {
        VStack(alignment: .leading, spacing: 12) {
            // Membership Details
            HStack {
                Text("MEMBERSHIP")
                    .modifier(CustomModifier(font: .callout))
                
                Image(systemName: "swiftdata")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
            Spacer()
            
            // User Information
            Text("AREN MUSAYELYAN")
                .modifier(CustomModifier(font: .title3))
            
            Text("DIPLOMA WORK")
                .modifier(CustomModifier(font: .callout))
        }
        .padding(20)
        .padding(.vertical, 10)
        .blendMode(.overlay)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

// MARK: - Custom Modifier
struct CustomModifier: ViewModifier {
    var font: Font
    func body(content: Content) -> some View {
        content
            .font(font)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .kerning(1.2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

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
    ContentView()
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
        UIVisualEffectView.animate(withDuration: 0.5) {
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

