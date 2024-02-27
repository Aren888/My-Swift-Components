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
                VStack() {
                    CircularProfileImageView(user: thread.user, size: .small)
                    
                    Spacer(minLength: 0)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 0) {
                        Text(thread.user?.userName ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 10)
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 16) {
                        Button(action: {}) {
                            Image(systemName: "heart")
                                .foregroundColor(.black)
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
                    
                    Spacer(minLength: 0)
                }
            }
            .padding(.vertical, 6)
            .padding(.horizontal)
            
            Divider()
        }
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.thread)
    }
}
