//
//  TextFieldsModifier.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 01.12.23.
//

import SwiftUI

struct TextFieldsModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
