//
//  ViewController.swift
//  InfiniteRollingBanner
//
//  Created by dely on 2021/01/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    private let cellIdentifier: String = "banner_collectionview_cell"
    private var listOfBanner: [String] = ["banner1", "banner2", "banner3", "banner4", "banner5"]
    private var timer: Timer?
    private var currentRow: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadListOfBanner()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(moveToAutoScroll), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moveToNextImage()
    }
    
    private func reloadListOfBanner() {
        if let firstBanner = listOfBanner.first, let lastBanner = listOfBanner.last {
            listOfBanner.append(firstBanner)
            listOfBanner.insert(lastBanner, at: 0)
        }
    }
    
    @objc private func moveToAutoScroll() {
        self.checkRange()
        self.currentRow = self.currentRow + 1
        let indexPath = IndexPath(row: currentRow, section: 0)
        bannerCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = UIScreen.main.bounds.width
        self.currentRow = Int(scrollView.contentOffset.x/width)
        self.checkRange()
    }
    
    func moveToNextImage() {
        let indexPath = IndexPath(row: self.currentRow, section: 0)
        bannerCollectionView.scrollToItem(at: indexPath, at: .right, animated: false)
    }
    
    func checkRange() {
        if isLastBanner() {
            self.currentRow = 1
        }else if isFirstBanner() {
            self.currentRow = listOfBanner.count-2
        }
        self.moveToNextImage()
    }
    
    func isFirstBanner() -> Bool {
        return self.currentRow == 0
    }
    
    func isLastBanner() -> Bool {
        return self.currentRow == listOfBanner.count - 1
    }
}
