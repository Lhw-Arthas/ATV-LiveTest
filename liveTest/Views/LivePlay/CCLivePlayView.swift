//
//  CCLivePlayView.swift
//  liveTest
//
//  Created by lhwarthas on 2022/11/21.
//

import SwiftUI
import AVKit

struct CCLivePlayView: UIViewControllerRepresentable {
  
    var ccLiveRoomId: String
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = CCLivePlayerViewController()
        controller.ccRoomId = ccLiveRoomId
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}
