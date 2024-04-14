//
//  ProfileView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ZStack {
            HomeBackgroundCirclesView()
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        
                        ProfileHeaderView(user: user)
                        
                        Button {} label: {
                            Text("Follow")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 352, height: 32)
                                .background(.black)
                                .cornerRadius(8)
                        }
                        
                        UserContentListView(user: user)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
