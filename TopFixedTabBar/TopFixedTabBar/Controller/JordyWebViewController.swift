//
//  JordyWebViewController.swift
//  TopFixedTabBar
//
//  Created by dely on 2021/01/31.
//

import UIKit
import WebKit

class JordyWebViewController: UIViewController {

    @IBOutlet weak var jordyWebView: WKWebView!
    private let jordyURL: String = "https://www.youtube.com/watch?v=y2YXl728YFg"
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: jordyURL) else { return }
        let request = URLRequest(url: url)
        jordyWebView.load(request)
    }
}
