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
        NavigationView {
            List {
                ForEach(listOfMusic) { music in
                    MusicCell(music: music)
                }
                
                HStack {
                    Spacer()
                    Text("\(listOfMusic.count) Album List")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("2ND DESIRE[TASTY]")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(listOfMusic: data)
    }
}

struct MusicCell: View {
    var music: Music
    var body: some View {
        NavigationLink(destination: Text(music.name)) {
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
