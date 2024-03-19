//
//  SignInSectionView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 18.03.24.
//

import SwiftUI

struct SignInSectionView: View {
    
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
        NavigationLink(destination: LoginView()) {
            Text(buttonTitle)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
                .background {
                    Capsule()
                        .fill(Color.white.gradient)
                        .shadow(radius: 10)
                }
        }
    }
}


#Preview {
    ContentView()
}
