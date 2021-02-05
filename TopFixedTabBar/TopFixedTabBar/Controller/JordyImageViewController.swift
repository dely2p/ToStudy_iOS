//
//  JordyImageViewController.swift
//  TopFixedTabBar
//
//  Created by dely on 2021/01/31.
//

import UIKit

class JordyImageViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var jordyImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        jordyImageView.image = UIImage(named: "jordytoon")
        NotificationCenter.default.addObserver(self, selector: #selector(scrollOn), name: .insideScrollOn, object: nil)
        self.scrollView.isScrollEnabled = false
    }
    
    @objc private func scrollOn() {
        self.scrollView.isScrollEnabled = true
    }
}
