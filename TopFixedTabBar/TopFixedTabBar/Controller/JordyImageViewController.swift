//
//  JordyImageViewController.swift
//  TopFixedTabBar
//
//  Created by dely on 2021/01/31.
//

import UIKit

class JordyImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var jordyImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        jordyImageView.image = UIImage(named: "jordytoon")
        NotificationCenter.default.addObserver(self, selector: #selector(scrollOn), name: .insideScrollOn, object: nil)
        self.scrollView.delegate = self
        self.scrollView.isScrollEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.scrollView.contentOffset.y = 0.0
    }
    
    @objc private func scrollOn() {
        self.scrollView.isScrollEnabled = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(self.scrollView.contentOffset.y)
        if self.scrollView.contentOffset.y <= 0 {
            self.scrollView.isScrollEnabled = false
            NotificationCenter.default.post(name: .insideScrollOff, object: nil)
        }
    }
}
