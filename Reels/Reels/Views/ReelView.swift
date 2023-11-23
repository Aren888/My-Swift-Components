//
//  ReelView.swift
//  Reels
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI
import AVKit

// MARK: - ReelView

/// A view representing an individual Reel.
struct ReelView: View {
    
    // MARK: Properties
    
    @Binding var reel: Reel
    @Binding var likedCounter: [Like]
    var size: CGSize
    var safeArea: EdgeInsets
    
    @State private var player: AVPlayer?
    @State private var looper: AVPlayerLooper?
    
    // MARK: Body
    
    var body: some View {
        GeometryReader {
            let rect = $0.frame(in: .scrollView(axis: .vertical))
            
            CustomVideoPlayer(player: $player)
                .preference(key: OffsetKeys.self, value: rect)
                .onPreferenceChange(OffsetKeys.self, perform: { value in
                    playPause(value)
                })
                .overlay(alignment: .bottom, content: {
                    ReelDetailsView()
                })
                .onTapGesture(count: 2, perform: { position in
                    let id = UUID()
                    likedCounter.append(.init(id: id, tappedRect: position, isAnimated: false))
                    
                    withAnimation(.snappy(duration: 1.2), completionCriteria: .logicallyComplete) {
                        if let index = likedCounter.firstIndex(where: { $0.id == id }) {
                            likedCounter[index].isAnimated = true
                        }
                    } completion: {
                        likedCounter.removeAll(where: { $0.id == id })
                    }
                    
                    reel.isLiked = true
                })
                .onAppear {
                    guard player == nil else { return }
                    guard let bundleID = Bundle.main.path(forResource: reel.videoID, ofType: "mp4") else { return }
                    let videoURL = URL(filePath: bundleID)
                    
                    let playerItem = AVPlayerItem(url: videoURL)
                    let queue = AVQueuePlayer(playerItem: playerItem)
                    looper = AVPlayerLooper(player: queue, templateItem: playerItem)
                    player = queue
                }
                .onDisappear {
                    player = nil
                }
        }
    }
    
    // MARK: - Play/Pause Logic
    
    func playPause(_ rect: CGRect) {
        if -rect.minY < (rect.height * 0.5) && rect.minY < (rect.height * 0.5) {
            player?.play()
        } else {
            player?.pause()
        }
        
        if rect.minY >= size.height || -rect.minY >= size.height {
            player?.seek(to: .zero)
        }
    }
    
    // MARK: - Reel Details View
    
    @ViewBuilder
    func ReelDetailsView() -> some View {
        HStack(alignment: .bottom, spacing: 10) {
            VStack(alignment: .leading, spacing: 8, content: {
                HStack(spacing: 10) {
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                    
                    Text(reel.authorName)
                        .font(.callout)
                        .lineLimit(1)
                }
                .foregroundStyle(.white)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .clipped()
            })
            
            Spacer(minLength: 0)
            
            VStack(spacing: 35) {
                Button("", systemImage: reel.isLiked ? "suit.heart.fill" : "suit.heart") {
                    reel.isLiked.toggle()
                }
                .symbolEffect(.bounce, value: reel.isLiked)
                .foregroundStyle(reel.isLiked ? .red : .white)
                
                Button("", systemImage: "message") { }
                
                Button("", systemImage: "paperplane") { }
                
                Button("", systemImage: "ellipsis") { }
            }
            .font(.title2)
            .foregroundStyle(.white)
        }
        .padding(.leading, 15)
        .padding(.trailing, 10)
        .padding(.bottom, safeArea.bottom + 15)
    }
}

// MARK: - Preview

#if DEBUG
struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
