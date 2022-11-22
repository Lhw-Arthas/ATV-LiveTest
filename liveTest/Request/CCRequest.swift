//
//  CCRequest.swift
//  liveTest
//
//  Created by lhwarthas on 2022/11/18.
//

import Foundation

enum CCRequest {
    
    static func requestLiveUrl(ccRoomId: String) async -> String {
        do {
            let liveInfo = try await WebRequest.requestJSON(url: "https://api.cc.163.com/v1/activitylives/anchor/lives?anchor_ccid=\(ccRoomId)")
            let channelId = liveInfo["data"][ccRoomId]["channel_id"].intValue
            let playJSON = try await WebRequest.requestJSON(url: "https://cc.163.com/live/channel/?channelids=\(channelId)")
            let videoPlayUrl = playJSON["data"][0]["sharefile"].stringValue
            return videoPlayUrl
        } catch let err {
            print(err)
        }
        return ""
    }
    
}
