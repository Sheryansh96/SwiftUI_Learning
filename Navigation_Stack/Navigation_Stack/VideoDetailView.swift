//
//  VideoDetailView.swift
//  Navigation_Stack
//
//  Created by Shreyas on 28/05/23.
//

import SwiftUI

struct VideoDetailView: View {
    
    var video : Video
    var body: some View {
        VStack(spacing:20){
            Spacer()
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height:150)
                .cornerRadius(12)
            
            TextView(video:video)
            
            HStack(spacing: 40){
                Label("\(video.viewCount)", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text(video.description)
                .font(.body)
                .padding()
            Spacer()
            Link(destination: video.url, label:{
                Button_Struct(title:"Watch Now")
            })
        }
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(video: VideoList.topTen.first!)
    }
}



