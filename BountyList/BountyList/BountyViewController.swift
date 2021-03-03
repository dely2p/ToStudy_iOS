//
//  BountyViewController.swift
//  BountyList
//
//  Created by dely on 2021/03/03.
//

import UIKit

class BountyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension BountyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
    }
}
