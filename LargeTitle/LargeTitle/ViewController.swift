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
    private var cellIdentifier: String = "pocketmonCell"
    private var filteredPockmon: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        pocketmonTableView.delegate = self
        pocketmonTableView.dataSource = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        self.title = "TextMemo"
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredPockmon.isEmpty ? pocketmon.count : filteredPockmon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = pocketmonTableView.dequeueReusableCell(withIdentifier: cellIdentifier) else { return UITableViewCell() }
        cell.textLabel?.text = textOfPocketmon(by: indexPath)
        return cell
    }
    
    private func textOfPocketmon(by indexPath: IndexPath) -> String {
        return self.filteredPockmon.isEmpty ? self.pocketmon[indexPath.row] : self.filteredPockmon[indexPath.row]
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            self.filteredPockmon = self.pocketmon.filter({ $0.lowercased().contains(text.lowercased()) })
        }else {
            self.filteredPockmon = []
        }
        self.pocketmonTableView.reloadData()
    }
}
