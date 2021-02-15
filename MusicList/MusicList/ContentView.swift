//
//  ContentView.swift
//  MusicList
//
//  Created by dely on 2021/02/14.
//

import SwiftUI

struct ContentView: View {
    var listOfMusic: [Music] = []
    var body: some View {
        List(listOfMusic) { music in
            Image(music.thumbnailName)
                .resizable()
                .frame(width: 30, height: 30)
                .cornerRadius(8)
                
            
            VStack(alignment: .leading) {
                Text(music.name)
                Text("play count: \(music.playCount)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(listOfMusic: data)
    }
}
