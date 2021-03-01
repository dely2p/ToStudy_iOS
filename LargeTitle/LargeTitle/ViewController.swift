//
//  ViewController.swift
//  LargeTitle
//
//  Created by dely on 2021/03/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pocketmonTableView: UITableView!
    private var pocketmon: [String] = ["피카츄", "라이츄", "파이리", "꼬부기", "버터풀", "야도란", "피죤투", "또가스"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pocketmonTableView.delegate = self
        pocketmonTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pocketmon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = pocketmonTableView.dequeueReusableCell(withIdentifier: "pocketmonCell") else { return UITableViewCell() }
        cell.textLabel?.text = self.pocketmon[indexPath.row]
        return cell
    }
}

