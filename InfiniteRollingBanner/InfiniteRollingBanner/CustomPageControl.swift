//
//  CustomPageControl.swift
//  InfiniteRollingBanner
//
//  Created by dely on 2021/01/17.
//

import Foundation
import UIKit

// https://stackoverrun.com/ko/q/12953356
class CustomPageControl: UIPageControl {
    var imageToBeReplacedByDot: UIImage {
       return UIImage() // Image you want to replace with dots
    }
        
    var circleImage: UIImage {
       return UIImage() //Default Image
    }

    override var numberOfPages: Int {
       didSet {
           updateDots()
       }
    }

    override var currentPage: Int {
       didSet {
           updateDots()
       }
    }

    override func awakeFromNib() {
       super.awakeFromNib()
       self.pageIndicatorTintColor = UIColor.clear
       self.currentPageIndicatorTintColor = UIColor.clear
       self.clipsToBounds = false
    }

    func updateDots() {
       var i = 0
       for view in self.subviews {
           var imageView = self.imageView(forSubview: view)
           if imageView == nil {
               if i == 0 {
                   imageView = UIImageView(image: imageToBeReplacedByDot)
               } else {
                   imageView = UIImageView(image: circleImage)
               }
               imageView!.center = view.center
               view.addSubview(imageView!)
               view.clipsToBounds = false
           }
           if i == self.currentPage {
               imageView!.alpha = 1.0
           } else {
               imageView!.alpha = 0.5
           }
           i += 1
       }
    }

    fileprivate func imageView(forSubview view: UIView) -> UIImageView? {
       var dot: UIImageView?
       if let dotImageView = view as? UIImageView {
           dot = dotImageView
       } else {
           for foundView in view.subviews {
               if let imageView = foundView as? UIImageView {
                   dot = imageView
                   break
               }
           }
       }
       return dot
    }
}
