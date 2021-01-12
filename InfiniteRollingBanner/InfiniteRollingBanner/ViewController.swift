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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadListOfBanner()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moveToNextImage(row: 1)
    }
    
    func reloadListOfBanner() {
        if let firstBanner = listOfBanner.first, let lastBanner = listOfBanner.last {
            listOfBanner.append(firstBanner)
            listOfBanner.insert(lastBanner, at: 0)
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
    
    func moveToNextImage(row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        bannerCollectionView.scrollToItem(at: indexPath, at: .right, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: width)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if isLastBanner(at: scrollView) {
            self.moveToNextImage(row: 1)
        }else if isFirstBanner() {
            self.moveToNextImage(row: listOfBanner.count-2)
        }
    }
    
    func isFirstBanner() -> Bool {
        return bannerCollectionView.contentOffset.x == 0.0
    }
    
    func isLastBanner(at scrollView: UIScrollView) -> Bool {
        let width = UIScreen.main.bounds.width
        return bannerCollectionView.contentOffset.x == scrollView.contentSize.width - width
    }
}
