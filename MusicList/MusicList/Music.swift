//
//  Music.swift
//  MusicList
//
//  Created by dely on 2021/02/15.
//

import Foundation

struct Music: Identifiable {
    var id = UUID()
    var name: String
    var playCount: Int
    var imageName: String { return name }
    var thumbnailName: String { return name + "Thumb" }
}

let data = [
    Music(name: "Tasty", playCount: 100),
    Music(name: "Sugar", playCount: 1840),
    Music(name: "Better", playCount: 800),
    Music(name: "Holiday", playCount: 472),
    Music(name: "이따 뭐해", playCount: 260),
    Music(name: "Next", playCount: 79)
]
