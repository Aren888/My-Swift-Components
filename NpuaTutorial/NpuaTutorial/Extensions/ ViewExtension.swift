//
//   ViewExtension.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.02.24.
//

import Foundation
import SwiftUI

extension View {
    func commonStyle(viewModel: HomeViewModel) -> some View {
        self
            .padding(.horizontal, viewModel.horizontalPadding)
            .padding(.top, viewModel.topPadding)
            .frame(height: viewModel.screenHeight)
    }
}
