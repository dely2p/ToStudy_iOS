//
//  ContentView.swift
//  MusicList
//
//  Created by dely on 2021/02/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(0 ..< 5) { item in
            Image(systemName: "photo")
            VStack(alignment: .leading) {
                Text("My MusicList")
                Text("play count")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
