//
//  VideoInfo.swift
//  Navigation_Stack
//
//  Created by Shreyas on 28/05/23.
//

import SwiftUI
struct VideoCell: View{
    var video: Video
    var body:some View{
        HStack{
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height:70)
                .cornerRadius(4)
                .padding(.vertical,4)
            
            VStack(alignment: .leading, spacing: 5){
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
        }
    }
}




