//
//  GetStartedSectionView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

struct GetStartedSectionView: View {
    
    @Binding var title: String
    @Binding var subTitle: String
    @Binding var buttonTitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            
            Text(title)
                .font(.system(size: 25))
                .fontWeight(.black)
            
            Text(subTitle)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        NavigationLink(destination: StartOnboardingView()) {
            Text(buttonTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
                .background {
                    Capsule()
                        .fill(Color.black)
                        .shadow(radius: 10)
                }
        }
    }
}

#Preview {
    ContentView()
}
