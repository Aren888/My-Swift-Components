//
//  ThreadCell.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 01.12.23.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Image("alex-profile-image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("alex.2001")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {
                            // Add your ellipsis button action here
                        }) {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    
                    Text("Formula 1 champion")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            // Add your heart button action here
                        }) {
                            Image(systemName: "heart")
                        }
                        
                        Button(action: {
                            // Add your bubble.right button action here
                        }) {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button(action: {
                            // Add your arrow.rectanglepath button action here
                        }) {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button(action: {
                            // Add your paperplane button action here
                        }) {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                }
            }
            .padding()
            Divider()
        }
    }
}

#Preview {
    ThreadCell()
}
