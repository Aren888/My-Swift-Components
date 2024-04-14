//
//  UserCell.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 07.12.23.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        ZStack {
            VStack {
                HomeGlassMorphismView(viewModel: HomeViewModel(), blurView: UIVisualEffectView(effect: .none))
            }
            HStack {
                CircularProfileImageView(user: user, size: .small)
                VStack(alignment: .leading) {
                    Text(user.userName)
                        .fontWeight(.semibold)
                    
                    Text(user.fullName)
                }
                .font(.footnote)
                
                Spacer()
                
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                            
                    }
                    .background(.white.gradient)
                    .cornerRadius(10)
                    .clipped()
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .frame(height: 60)
    }
}


struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: dev.user)
    }
}
