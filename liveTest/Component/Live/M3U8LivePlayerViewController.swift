//
//  M3U8LivePlayerViewController.swift
//  liveTest
//
//  Created by lhwarthas on 2022/11/21.
//

import Foundation
import AVKit

class M3U8LivePlayerViewController : CommonPlayerViewController {
    var playUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await self.playmedia(playUrl: playUrl)
        }
    }
    
    private func playmedia(playUrl: String) async {
        guard let playURL = URL(string: playUrl) else {
            showErrorAlertAndExit(message: "URL解析错误")
            return
        }
        let asset = AVURLAsset(url: playURL)
        prepare(toPlay: asset)
    }
}

// MARK: - Player
extension M3U8LivePlayerViewController {
    @MainActor
    func prepare(toPlay asset: AVURLAsset) {
        if !asset.isPlayable {
            showErrorAlertAndExit(message: "URL解析错误")
            return
        }
        playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
    }
}
