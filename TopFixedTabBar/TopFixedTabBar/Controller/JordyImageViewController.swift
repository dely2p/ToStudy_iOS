//
//  JordyImageViewController.swift
//  TopFixedTabBar
//
//  Created by dely on 2021/01/31.
//

import UIKit

class JordyImageViewController: UIViewController {

    @IBOutlet weak var jordyImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        jordyImageView.image = UIImage(named: "jordytoon")
    }
}
