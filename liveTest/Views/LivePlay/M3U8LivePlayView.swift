//
//  M3U8PlayView.swift
//  liveTest
//
//  Created by lhwarthas on 2022/11/21.
//

import SwiftUI
import AVKit

struct M3U8LivePlayView: UIViewControllerRepresentable {
  
    var playUrl: String
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = M3U8LivePlayerViewController()
        controller.playUrl = playUrl
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}
