//
//  CCLivePlayController.swift
//  liveTest
//
//  Created by lhwarthas on 2022/11/21.
//

import Foundation
import AVKit

class CCLivePlayerViewController : CommonPlayerViewController {
    
    var ccRoomId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await self.fetchLiveData()
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

// MARK: - Requests

extension CCLivePlayerViewController {
    func fetchLiveData() async {
        let url = await CCRequest.requestLiveUrl(ccRoomId: ccRoomId)
        await playmedia(playUrl: url)
    }
}

// MARK: - Player
extension CCLivePlayerViewController {
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
