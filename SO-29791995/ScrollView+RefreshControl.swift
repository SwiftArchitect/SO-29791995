//
//  ScrollView+RefreshControl.swift
//  SO-29791995
//
//  Copyright © 2017, 2018 Xavier Schott
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

extension UIScrollView {

    // Exposes a _refreshControl property to iOS versions anterior to iOS 10
    // Use _refreshControl and refreshControl intercheangeably in a UIScrollView (get + set)
    //
    // All iOS versions: `bounces` is always required if `contentSize` is smaller than `frame`
    // Pre iOS 10 versions: `alwaysBounceVertical` is also required for small content
    // Only iOS 10 allows the refreshControl to work without drifting when pulled to refresh
    var _refreshControl : UIRefreshControl? {
        get {
            if #available(iOS 10.0, *) {
                return refreshControl
            } else {
                return subviews.first(where: { (view: UIView) -> Bool in
                    view is UIRefreshControl
                }) as? UIRefreshControl
            }
        }

        set {
            if #available(iOS 10.0, *) {
                refreshControl = newValue
            } else {
                // Unique instance of UIRefreshControl added to subviews
                if let oldValue = _refreshControl {
                    oldValue.removeFromSuperview()
                }
                if let newValue = newValue {
                    insertSubview(newValue, at: 0)
                }
            }
        }
    }

    // Creates and adds a UIRefreshControl to this UIScrollView
    func addRefreshControl(target: Any?, action: Selector) -> UIRefreshControl {
        let control = UIRefreshControl()
        addRefresh(control: control, target: target, action: action)
        return control
    }

    // Adds the UIRefreshControl passed as parameter to this UIScrollView
    func addRefresh(control: UIRefreshControl, target: Any?, action: Selector) {
        if #available(iOS 9.0, *) {
            control.addTarget(target, action: action, for: .primaryActionTriggered)
        } else {
            control.addTarget(target, action: action, for: .valueChanged)
        }
        _refreshControl = control
    }
}
