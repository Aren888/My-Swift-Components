//
//  ColorExtension.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 22.01.24.
//

import SwiftUI

extension Color {

    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
