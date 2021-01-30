//
//  ViewController.swift
//  TopFixedTabBar
//
//  Created by dely on 2021/01/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tabBarCollectionView: UICollectionView!
    private let listOfContents: [String] = ["first", "second"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfContents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = tabBarCollectionView.dequeueReusableCell(withReuseIdentifier: "tabBarCell", for: indexPath) as?TabBarCollectionViewCell else { return UICollectionViewCell() }
        cell.titleLabel.text = listOfContents[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width/2
        return CGSize(width: width, height: collectionView.frame.height)
    }
}
