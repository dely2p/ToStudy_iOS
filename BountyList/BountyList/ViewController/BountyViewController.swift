//
//  BountyViewController.swift
//  BountyList
//
//  Created by dely on 2021/03/03.
//

import UIKit

class BountyViewController: UIViewController {
    let viewModel = BountyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.detailViewModel.update(model: viewModel.bountyInfo(at: index))
            }
        }
    }
}

extension BountyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numOfBountyInfoList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCollectionViewCell else { return UICollectionViewCell() }
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        let width: CGFloat = (collectionView.bounds.width/2 - itemSpacing)
        let height: CGFloat = width * 10/7 + textAreaHeight
        return CGSize(width: width, height: height)
    }
}
