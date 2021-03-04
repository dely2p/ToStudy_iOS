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
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let detailViewModel = DetailViewModel()
    
    var bountyInfo: BountyInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimaion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    private func prepareAnimaion() {
        nameLabelCenterX.constant = view.bounds.width
        bountyLabelCenterX.constant = view.bounds.width
    }
    
    private func showAnimation() {
        nameLabelCenterX.constant = 0
        bountyLabelCenterX.constant = 0
        
//        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
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
