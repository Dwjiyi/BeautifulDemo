//
//  MainController.swift
//  BeautifulDemo
//
//  Created by yu on 2019/3/8.
//  Copyright © 2019 yu. All rights reserved.
//

import UIKit

class MainController: UIViewController {
 
    //MARK: -- Property
    // 菜单控制器
    fileprivate var menuVC: MenuController!
    // 每日最美，限免推荐，文章专栏控制器
    fileprivate var homeVC: HomeController?
    // 当前展示的控制器
    fileprivate var currentVC: UIViewController!
    // 透明图层
    fileprivate var coverView: UIWindow!
    // 菜单栏侧滑最大宽度
    fileprivate let menuMaxWidth: CGFloat = UIConstant.SCREEN_WIDTH * 0.8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildController()
        // 添加浮层，用于点击，拖拽收起菜单
        addCoverView()
    }
}


//MARK: -- Private Methods
extension MainController {
    fileprivate func setupChildController() {
        menuVC = MenuController()
        menuVC.view.frame = CGRect(x: 0, y: 0, width: menuMaxWidth, height: UIConstant.SCREEN_HEIGHT)
        menuVC.view.backgroundColor = UIColor.gray
        homeVC = HomeController()
        currentVC = homeVC
        currentVC.view.frame = CGRect(x: menuMaxWidth, y: 0, width: UIConstant.SCREEN_WIDTH, height: UIConstant.SCREEN_HEIGHT)
        currentVC.view.backgroundColor = UIColor.blue
        
        addChild(menuVC)
        addChild(currentVC)
        
        view.addSubview(menuVC.view)
        view.addSubview(currentVC.view)
    }

    fileprivate func addCoverView() {
        coverView = UIWindow(frame: currentVC.view.bounds)
        coverView.isHidden = false
        coverView.backgroundColor = UIColor.red
        currentVC.view.addSubview(coverView)
        // 添加拖拽手势
        let pan = UIPanGestureRecognizer(target: self, action: #selector(MainController.menuDidPan(_:)))
        coverView.addGestureRecognizer(pan)
        // 添加点击手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(MainController.menuHiddenAnimation))
        coverView.addGestureRecognizer(tap)
        
        view.bringSubviewToFront(coverView)
    }
    
    
    /**
     浮层拖拽
     */
    @objc fileprivate func menuDidPan(_ pan: UIPanGestureRecognizer) {
        let point = pan.translation(in: pan.view)
        print(point.x)
        if pan.state == .cancelled || pan.state == .ended {
            menuHiddenAnimation()
        } else {
            // 正在拖拽
            currentVC.view.x = menuMaxWidth + point.x
            if currentVC.view.x <= 0 {
                currentVC.view.x = 0
                coverView.isHidden = true
            } else if currentVC.view.x >= menuMaxWidth {
                currentVC.view.x = menuMaxWidth
                coverView.isHidden = false
            }
        }
    }
    
    /**
     隐藏菜单栏
     */
    @objc fileprivate func menuHiddenAnimation() {
        UIView.animate(withDuration: 0.3, animations: {
            self.currentVC.view.frame.origin.x = 0
        }) { (finish) in
            self.coverView.isHidden = true
        }
    }
}

