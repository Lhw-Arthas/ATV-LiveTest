//
//  M3U8LiveView.swift
//  liveTest
//
//  Created by lhwarthas on 2022/11/21.
//

import SwiftUI

struct M3U8LiveView: View {
    @State private var useM3U8Live: M3U8Live?
    
    private let liveRooms = [
        M3U8Live(name: "凤凰中文", url: "http://play-live.ifeng.com/live/06OLEGEGM4G.m3u8"),
        M3U8Live(name: "凤凰资讯", url: "http://play-live.ifeng.com/live/06OLEEWQKN4.m3u8"),
        M3U8Live(name: "CCTV16", url: "http://liveop.cctv.cn/hls/CCTV16HD/playlist.m3u8"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(liveRooms) { liveRoom in
                    Button(liveRoom.name) {
                        useM3U8Live = liveRoom
                    }
                }
            }
        }.fullScreenCover(item: $useM3U8Live) {}
        content: { i in
            toPlay(m3u8Live: i)
        }
    }
    
    func toPlay(m3u8Live: M3U8Live) -> some View {
        return M3U8LivePlayView(playUrl: m3u8Live.url).edgesIgnoringSafeArea(.all)
    }
}

struct M3U8Live: Identifiable {
    var id = UUID()
    var name: String
    var url: String
}
