//
//  DetailViewModel.swift
//  BountyList
//
//  Created by dely on 2021/03/04.
//

import Foundation

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
