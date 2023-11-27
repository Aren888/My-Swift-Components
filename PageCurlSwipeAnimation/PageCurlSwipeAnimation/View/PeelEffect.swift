//
//  PeelEffect.swift
//  PageCurlSwipeAnimation
//
//  Created by Solicy Ios on 27.11.23.
//

import SwiftUI

struct PeelEffect<Content: View>: View {
    var content: Content
    var onDelete: () -> ()
    
    // TODO: Add comments for the init method
    init(@ViewBuilder content: @escaping () -> Content, onDelete: @escaping () -> ()) {
        self.content = content()
        self.onDelete = onDelete
    }
    
    // MARK: - State Variables
    @State private var dragProgress: CGFloat = 0
    @State private var isExpanded: Bool = false
    
    var body: some View {
        content
            .hidden()
            .overlay(content: {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    let minX = rect.minX
                    
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(.red.gradient)
                        .overlay(alignment: .trailing) {
                            Button {
                                // TODO: Add comments for the delete button action
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                    dragProgress = 1
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                    onDelete()
                                }
                            } label: {
                                Image(systemName: "trash")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .padding(.trailing, 20)
                                    .foregroundStyle(.white)
                                    .contentShape(Rectangle())
                            }
                            .disabled(!isExpanded)
                        }
                        .padding(.vertical, 8)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    // TODO: Add comments for the drag gesture handling
                                    guard !isExpanded else { return }
                                    var translationX = value.translation.width
                                    translationX = max(-translationX, 0)
                                    let progress = min(1, translationX / rect.width)
                                    dragProgress = progress
                                })
                                .onEnded({ value in
                                    // TODO: Add comments for the drag gesture end handling
                                    guard !isExpanded else { return }
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                        if dragProgress > 0.25 {
                                            dragProgress = 0.6
                                            isExpanded = true
                                        } else {
                                            dragProgress = .zero
                                            isExpanded = false
                                        }
                                    }
                                })
                        )
                    
                        .onTapGesture {
                            // TODO: Add comments for the tap gesture handling
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                dragProgress = .zero
                                isExpanded = false
                            }
                        }
                    
                    Rectangle()
                        .fill(.black)
                        .padding(.vertical, 23)
                        .shadow(color: .black.opacity(0.3), radius: 15, x: 30, y: 0)
                        .padding(.trailing, rect.width * dragProgress)
                        .mask(content)
                        .allowsHitTesting(false)
                        .offset(x: dragProgress == 1 ? -minX : 0)
                    content
                        .mask {
                            Rectangle()
                                .padding(.trailing, dragProgress * rect.width)
                        }
                        .allowsHitTesting(false)
                        .offset(x: dragProgress == 1 ? -minX : 0)
                }
            })
            .overlay {
                GeometryReader {
                    let size = $0.size
                    let minX = $0.frame(in: .global).minX
                    let minOpacity = dragProgress / 0.05
                    let opacity = min(1, minOpacity)
                    
                    content
                        .shadow(color: .black.opacity(dragProgress != 0 ? 0.1 : 0), radius: 5, x: 15, y: 0)
                        .overlay {
                            Rectangle()
                                .fill(.white.opacity(0.25))
                                .mask(content)
                        }
                        .overlay(alignment: .trailing) {
                            Rectangle()
                                .fill(
                                    .linearGradient(colors: [
                                        .clear,
                                        .white,
                                        .clear,
                                        .clear
                                    ], startPoint: .leading, endPoint: .trailing)
                                )
                                .frame(width: 60)
                                .offset(x: 40)
                                .offset(x: -30 + (30 * opacity))
                                .offset(x: size.width * -dragProgress)
                        }
                        .scaleEffect(x: -1)
                        .offset(x: size.width - (size.width * dragProgress))
                        .offset(x: size.width * -dragProgress)
                        .mask {
                            Rectangle()
                                .offset(x: size.width * -dragProgress)
                        }
                        .offset(x: dragProgress == 1 ? -minX : 0)
                    
                }
                .allowsHitTesting(false)
            }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
