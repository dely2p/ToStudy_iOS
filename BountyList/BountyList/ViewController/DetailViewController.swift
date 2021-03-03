//
//  DetailViewController.swift
//  BountyList
//
//  Created by dely on 2021/03/04.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    let detailViewModel = DetailViewModel()
    
    var bountyInfo: BountyInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let bountyInfo = detailViewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
