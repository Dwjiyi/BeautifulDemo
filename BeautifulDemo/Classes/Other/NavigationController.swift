//
//  NavigationController.swift
//  BeautifulDemo
//
//  Created by yu on 2019/3/8.
//  Copyright © 2019 yu. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        interactivePopGestureRecognizer?.delegate = self
//        delegate = self
    }
}

extension NavigationController: UIGestureRecognizerDelegate {}
//
//extension NavigationController: UINavigationControllerDelegate {
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        // 设置支持右滑返回手势
//        interactivePopGestureRecognizer?.isEnabled = true
//    }
//}
