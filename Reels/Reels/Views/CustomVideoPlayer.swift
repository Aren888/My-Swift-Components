//
//  CustomVideoPlayer.swift
//  Reels
//
//  Created by Solicy Ios on 23.11.23.
//

import SwiftUI
import AVKit

// MARK: - CustomVideoPlayer

/// A SwiftUI representation of an AVPlayer using UIViewControllerRepresentable.
struct CustomVideoPlayer: UIViewControllerRepresentable {
    
    // MARK: Properties
    
    @Binding var player: AVPlayer?
    
    // MARK: Methods
    
    /// Creates the AVPlayerViewController and configures it with the provided AVPlayer.
    /// - Parameter context: The context in which the UIViewControllerRepresentable was created.
    /// - Returns: An instance of AVPlayerViewController.
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.videoGravity = .resizeAspectFill
        controller.showsPlaybackControls = false
        
        return controller
    }
    
    /// Updates the AVPlayer for the AVPlayerViewController.
    /// - Parameters:
    ///   - uiViewController: The AVPlayerViewController to be updated.
    ///   - context: The context in which the update was requested.
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player
    }
}
