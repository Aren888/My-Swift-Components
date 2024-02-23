//
//  ThreadCell.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 08.01.24.
//

import SwiftUI

struct ThreadCell: View {
    
    let thread: Thread
    
    var body: some View {
        VStack(alignment: .center) {
            
            HStack(alignment: .center) {
                
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 0) {
                        
                        if let userName = thread.user?.userName {
                            Text(userName)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 14)
                            
                        } else {
                            LoadingView()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(width: 60, height: 14)
                                .padding(.trailing, 80)
                            
                                .cornerRadius(9)
                            
                        }
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .frame(height: 14)
                            .padding(.trailing, 10)
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    if (thread.user?.userName) != nil {
                        Text(thread.caption)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 14)
                    } else {
                        LoadingView()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(width: 80, height: 14)
                            .cornerRadius(9)
                    }
                    HStack(spacing: 16) {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "heart")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundStyle(.black)
                }
            }
            .padding()
            .frame(height: 70)

            Divider()
        }
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.thread)
    }
}
