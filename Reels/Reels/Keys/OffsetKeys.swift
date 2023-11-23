//
//  OffsetKeys.swift
//  Reels
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI

// MARK: - OffsetKeys

/// A preference key for storing and passing CGRect values.
struct OffsetKeys: PreferenceKey {
    
    // MARK: Properties
    
    /// The default value for the preference key, initialized as CGRect.zero.
    static var defaultValue: CGRect = .zero
    
    // MARK: Methods
    
    /// Reduces the values passed through the preference key.
    /// - Parameters:
    ///   - value: The current accumulated value.
    ///   - nextValue: A closure providing the next value to be combined with the accumulated value.
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
