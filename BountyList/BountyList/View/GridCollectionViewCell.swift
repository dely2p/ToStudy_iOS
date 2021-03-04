//
//  GridCollectionViewCell.swift
//  BountyList
//
//  Created by dely on 2021/03/04.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}
