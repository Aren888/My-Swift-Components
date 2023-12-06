//
//  CircularProfileImageView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 07.12.23.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("gabriella-profile-image")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
