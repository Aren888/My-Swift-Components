//
//  ProfileHeaderView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullName ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.userName ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("\(Int.random(in: 100..<999)) followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            CircularProfileImageView(user: user, size: .large)
        }
       
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(.white.gradient.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
