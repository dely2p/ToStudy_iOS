//
//  BountyInfo.swift
//  BountyList
//
//  Created by dely on 2021/03/04.
//

import Foundation
import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
