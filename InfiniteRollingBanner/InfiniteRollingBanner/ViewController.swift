//
//  ViewController.swift
//  InfiniteRollingBanner
//
//  Created by dely on 2021/01/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var bannerPageControl: UIPageControl!
    private let cellIdentifier: String = "banner_collectionview_cell"
    private var listOfBanner: [String] = ["banner1", "banner2", "banner3", "banner4", "banner5"]
    private var timer: Timer?
    private var currentRow: Int = 1
    private var scrollDirection: ScrollDirectionType = .right

    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadListOfBanner()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
        bannerPageControl.backgroundStyle = .prominent
        bannerPageControl.preferredIndicatorImage = UIImage(named: "page_control_dot")
        bannerPageControl.setIndicatorImage(UIImage(named: "page_control_long"), forPage: 0)
//        bannerPageControl.pageIndicatorTintColor = .gray
//        bannerPageControl.currentPageIndicatorTintColor = .white
        makePageIndicator(for: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moveInCycle()
    }
    
    private func reloadListOfBanner() {
        if let firstBanner = listOfBanner.first, let lastBanner = listOfBanner.last {
            listOfBanner.append(firstBanner)
            listOfBanner.insert(lastBanner, at: 0)
            bannerPageControl.numberOfPages = listOfBanner.count - 2
            bannerPageControl.currentPage = 0
//            makePageIndicator(for: 0)
        }
    }
    
    private func makePageIndicator(for page: Int) {
//        for index in 0..<(listOfBanner.count-2) {
//            var imageName: String = "page_control_dot"
//            if index == page {
//                imageName = "page_control_long.fill"
//            }else {
//                imageName = "page_control_dot.fill"
//            }
//            print(page)
//            bannerPageControl.setIndicatorImage(UIImage(named: imageName), forPage: index)
//        }
        
        for index in 0..<(listOfBanner.count-2) {
            bannerPageControl.setIndicatorImage(UIImage(named: "page_control_dot"), forPage: index)
            bannerPageControl.pageIndicatorTintColor = nil
        }
        bannerPageControl.setIndicatorImage(UIImage(named: "page_control_long"), forPage: page)
    }
    
    @objc private func moveToNextPage() {
        self.checkRange()
        bannerPageControl.currentPage = currentRow
        makePageIndicator(for: currentRow)
        if scrollDirection == .right {
            self.currentRow = self.currentRow + 1
            let indexPath = IndexPath(row: currentRow, section: 0)
            bannerCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }else { // scrollDirection == .left
            self.currentRow = self.currentRow - 1
            let indexPath = IndexPath(row: currentRow, section: 0)
            bannerCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
            bannerPageControl.currentPage = currentRow - 1
//            makePageIndicator(for: currentRow-1)
            scrollDirection = .right
        }
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listOfBanner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
        cell.bannerImageView.image = UIImage(named: listOfBanner[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: width)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let velocity = scrollView.panGestureRecognizer.velocity(in: scrollView)
        if velocity.x < 0 { // move to right
            self.scrollDirection = .right
        }else { // move to left
            self.scrollDirection = .left
        }
        moveToNextPage()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.checkRange()
    }
    
    func moveInCycle() {
        let indexPath = IndexPath(row: self.currentRow, section: 0)
        bannerCollectionView.scrollToItem(at: indexPath, at: .right, animated: false)
    }
    
    func checkRange() {
        if isLastBanner(), scrollDirection == .right {
            self.currentRow = 0
            self.moveInCycle()
        }else if isFirstBanner(), scrollDirection == .left {
            self.currentRow = listOfBanner.count-2
            self.moveInCycle()
        }
    }
    
    func isFirstBanner() -> Bool {
        return self.currentRow == 0
    }
    
    func isLastBanner() -> Bool {
        return self.currentRow == listOfBanner.count - 2
    }
}

enum ScrollDirectionType: Int {
    case right, left
}
