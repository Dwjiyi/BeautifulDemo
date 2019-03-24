//
//  UITableView+Extension.swift
//  BeautifulDemo
//
//  Created by yu on 2019/3/22.
//  Copyright © 2019 yu. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Register Cell Nib
    func wy_registerCellNib<T: UITableViewCell>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
    }
    
    /// Register Cell Class
    func wy_registerCellClass<T: UITableViewCell>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        self.register(aClass, forCellReuseIdentifier: name)
    }

    /// Reuse Cell Nib
    func wy_dequeueReusableCell<T: UITableViewCell>(_ aClass: T.Type, indexPath: IndexPath) -> T {
        let name = String(describing: aClass)
        guard let cell = dequeueReusableCell(withIdentifier: name, for: indexPath) as? T else {
            fatalError("\(name) is not registed")
        }
        return cell
    }
    
    /// Reuse Cell Class
    func wy_dequeueReusableCell<T: UITableViewCell>(_ aClass: T.Type) -> T {
        let name = String(describing: aClass)
        guard let cell = dequeueReusableCell(withIdentifier: name) as? T else {
            fatalError("\(name) is not registed")
        }
        return cell
    }

    /// Register HeaderFooter Nib
    func wy_registerHeaderFooterNib<T: UITableViewHeaderFooterView>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: name)
    }
    
    /// Register HeaderFooter Class
    func wy_registerHeaderFooterClass<T: UITableViewHeaderFooterView>(_ aClass: T.Type) {
        let name = String(describing: aClass)
        self.register(aClass, forHeaderFooterViewReuseIdentifier: name)
    }
    
    /// Reuse HeaderFooter
    func wy_dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>(_ aClass: T.Type) -> T {
        let name = String(describing: aClass)
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: name) as? T else {
            fatalError("\(name) is not registed")
        }
        return cell
    }
    
    /// Cell For Row
    func wy_cellForRow<T: UITableViewCell>(_ aClass: T.Type, indexPath: IndexPath) -> T {
        guard let cell = cellForRow(at: indexPath) as? T else {
            fatalError("\(indexPath) is Not Exist")
        }
        return cell
    }
    
    
    
}
