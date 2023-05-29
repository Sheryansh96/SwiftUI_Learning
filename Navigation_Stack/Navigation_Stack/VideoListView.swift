//
//  ContentView.swift
//  Navigation_Stack
//
//  Created by Shreyas on 26/05/23.
//

import SwiftUI

struct VideoListView: View {
    var videos:[Video] = VideoList.topTen
    var body: some View {
        NavigationView{
            List(videos){ video in
                NavigationLink(destination: VideoDetailView(video: video),
                    label: {
                    VideoCell(video: video)
                })
            }
            .listStyle(.plain)
            .navigationTitle("Shreyansh's Top 10")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
