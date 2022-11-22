//
//  ContentView.swift
//  liveTest
//
//  Created by lhwarthas on 2022/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            CCLiveView().tabItem { Text("CC直播") }.tag(1)
            M3U8LiveView().tabItem { Text("IPTV/M3U8直播") }.tag(2)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
