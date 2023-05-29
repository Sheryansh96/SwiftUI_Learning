//
//  VideoModifier.swift
//  Navigation_Stack
//
//  Created by Shreyas on 28/05/23.
//

import SwiftUI

struct Button_Struct: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
            .font(.title2)
            .frame(width: 280, height: 50)
            .background(Color(.systemRed))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct TextView: View {
    var video: Video
    var body: some View {
        Text(video.title)
            .font(.title2)
            .fontWeight(.semibold)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
}

