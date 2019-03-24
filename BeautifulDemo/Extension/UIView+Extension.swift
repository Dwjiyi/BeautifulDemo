//
//  UIView+Extension.swift
//  BeautifulDemo
//
//  Created by yu on 2019/3/8.
//  Copyright © 2019 yu. All rights reserved.
//

import UIKit


// MARK: - 一些扩展方法
extension UIView {
    func setCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}


// MARK: - Frame 相关
extension UIView {

    public var x: CGFloat {
        get { return self.frame.origin.x }
        
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var y : CGFloat {
        get { return self.frame.origin.y }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var width : CGFloat {
        get { return self.frame.size.width }
        
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    public var height : CGFloat {
        get { return self.frame.size.height }
        
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var size : CGSize {
        get { return self.frame.size }
        
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    public var origin : CGPoint {
        get { return self.frame.origin }
        
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    public var maxY : CGFloat {
        get { return self.frame.maxY }
    }
}
