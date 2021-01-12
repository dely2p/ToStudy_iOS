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
        if let firstBanner = listOfBanner.first {
            listOfBanner.append(firstBanner)
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
    
    func readyToNextImage() {
        // 마지막 이미지일 때 이동
        let indexPath = IndexPath(row: 0, section: 0)
        bannerCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .right)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: width)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.contentSize.width, bannerCollectionView.contentOffset.x)
        let width = UIScreen.main.bounds.width
        if scrollView.contentSize.width - width == bannerCollectionView.contentOffset.x {
            self.readyToNextImage()
        }
    }
}
