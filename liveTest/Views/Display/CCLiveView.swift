//
//  CCLiveView.swift
//  liveTest
//
//  Created by lhwarthas on 2022/11/21.
//

import SwiftUI

struct CCLiveView: View {
    
    @State private var useCCLive: CCLive?
    
    private let liveRooms = [
        CCLive(name: "Quin", roomId: "361433"),
        CCLive(name: "秋种琉璃子不语", roomId: "28151060"),
        CCLive(name: "我才不是谐星", roomId: "46213653"),
        CCLive(name: "花舞-寒脊山小径", roomId: "23747489"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(liveRooms) { liveRoom in
                    Button(liveRoom.name) {
                        useCCLive = liveRoom
                    }
                }
            }
        }.fullScreenCover(item: $useCCLive) {}
        content: { i in
            readyPlay(ccLive: i)
        }
    }
    
    
    func readyPlay(ccLive: CCLive) -> some View {
        return CCLivePlayView(ccLiveRoomId: ccLive.roomId).edgesIgnoringSafeArea(.all)
    }
}

struct CCLive: Identifiable {
    var id = UUID()
    var name: String
    var roomId: String
}
