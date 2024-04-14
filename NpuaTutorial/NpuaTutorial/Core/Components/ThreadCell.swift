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
        VStack(alignment: .leading) {
            HStack {
                VStack {
                    CircularProfileImageView(user: thread.user, size: .small)
                    
                    Spacer(minLength: 0)
                }
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(thread.user?.userName ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {}) {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 2)
                    
                    HStack(spacing: 16) {
                        ButtonGroup(systemImage: "heart.fill", action: {}, count: Int.random(in: 1...99), thread: thread)
                        
                        ButtonGroup(systemImage: "bubble.right", action: {}, count: Int.random(in: 1...99), thread: thread)
                        
                        ButtonGroup(systemImage: "arrow.rectanglepath", action: {}, count: Int.random(in: 1...99), thread: thread)
                        
                        ButtonGroup(systemImage: "paperplane", action: {}, count: Int.random(in: 1...99), thread: thread)
                    }
                }
            }
            .padding(6)
            .background(.white.gradient.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.horizontal)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ButtonGroup: View {
    let systemImage: String
    let action: () -> Void
    let count: Int
    let thread: Thread
    
    var body: some View {
        VStack {
            Button(action: action) {
                Image(systemName: imageSystemName)
                    .frame(width: 22, height: 20)
                    .foregroundStyle(imageForegroundColor)
            }
            .buttonStyle(DefaultButtonStyle())
            
            Text(countText)
                .font(.caption)
                .frame(width: 22, height: 10)
                .padding(.bottom, 6)
        }
        .foregroundStyle(.black)
    }
    
    private var isHeartFill: Bool {
        systemImage == "heart.fill"
    }
    
    private var isLiked: Bool {
        thread.likes > 25 && isHeartFill
    }
    
    private var imageSystemName: String {
        isHeartFill ? (isLiked ? "heart.fill" : "heart") : systemImage
    }
    
    private var imageForegroundColor: Color {
        isLiked ? .red : .black
    }
    
    private var countText: String {
        isHeartFill ? "\(thread.likes)" : "\(count)"
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: dev.thread)
            .frame(height: 100)
            .padding(.vertical, 5)
            .padding(.horizontal)
    }
}
