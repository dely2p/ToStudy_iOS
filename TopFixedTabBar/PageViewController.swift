//
//  PageViewController.swift
//  TopFixedTabBar
//
//  Created by dely on 2021/01/31.
//

import UIKit

class PageViewController: UIPageViewController {

    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: "firstView"), self.VCInstance(name: "secondView")]
    }()
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = VCArray.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return VCArray.last }
        guard VCArray.count > previousIndex else { return nil }
        return VCArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex >= 0 else { return VCArray.last }
        guard VCArray.count > nextIndex else { return nil }
        return VCArray[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArray.firstIndex(of: firstViewController) else { return 0 }
        return firstViewControllerIndex
    }
}
