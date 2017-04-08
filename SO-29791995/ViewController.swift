//
//  ViewController.swift
//  SO-29791995
//
//  Copyright © 2017 Xavier Schott
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var osLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let refreshControl = scrollView.addRefreshControl(target: self,
                                                          action: #selector(doRefresh(_:)))
        refreshControl.tintColor = UIColor.white

        refreshControl.attributedTitle =
            NSAttributedString(string: "Pull for White Flash",
                               attributes: [
                                NSForegroundColorAttributeName: UIColor.white,
                                NSFontAttributeName: UIFont(name: "HelveticaNeue-UltraLight",
                                                            size: 36.0)! ])

        osLabel.text = "iOS \(UIDevice.current.systemVersion)"
    }

    // Pull to refresh flash animation
    func doRefresh(_ sender: UIRefreshControl) {
        sender.endRefreshing()
        UIView.animate(withDuration: 0.1, animations: {
            self.view.tintColor = self.view.backgroundColor // store color
            self.view.backgroundColor = UIColor.white
        }) { (Bool) in
            self.view.backgroundColor = self.view.tintColor // restore color
        }
    }
}

