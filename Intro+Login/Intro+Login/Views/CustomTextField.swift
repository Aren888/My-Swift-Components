//
//  CustomTextField.swift
//  Intro+Login
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

// Custom text field with leading icon
struct CustomTextField: View {
    @Binding var text: String
    var hint: String
    var leadingIcon: Image
    var isPassword: Bool = false
    
    var body: some View {
        HStack(spacing: -10) {
            // Leading icon
            leadingIcon
                .font(.callout)
                .foregroundStyle(.gray)
                .frame(width: 40, alignment: .leading)
            
            // Text field or secure field based on whether it's a password field
            if isPassword {
                SecureField(hint, text: $text)
            } else {
                TextField(hint, text: $text)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .background {
            // Rounded rectangle background for the text field
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(.gray.opacity(0.1))
        }
    }
}
