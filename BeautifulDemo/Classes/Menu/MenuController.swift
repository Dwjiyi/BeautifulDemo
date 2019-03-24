//
//  MenuController.swift
//  BeautifulDemo
//
//  Created by yu on 2019/3/8.
//  Copyright © 2019 yu. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainTableView)
        view.addSubview(footerView)
        setupLayout()
        // reloadData刷新完后再执行后面的代码
        mainTableView.layoutIfNeeded()
        // 默认选中第一行  PS: selectRow方法只选中cell，不会调用didSelect代理方法, 手动调用
        mainTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .none)
        mainTableView.delegate?.tableView!(mainTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
    }
    
    fileprivate func setupLayout() {
        mainTableView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self.view)
            make.height.equalTo(UIConstant.SCREEN_HEIGHT - 40)
        }
        
        footerView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.height.equalTo(40)
        }
    }

    //MARK: --------------- Property -------------------
    lazy fileprivate var mainTableView: UITableView = {
        let mainTableView = UITableView()
        mainTableView.backgroundColor = UIColor.clear
        let header = MenuHeaderView(frame: CGRect(x: 0, y: 0, width: UIConstant.SCREEN_WIDTH, height: 120))
        mainTableView.tableHeaderView = header
        mainTableView.separatorStyle = .none
        mainTableView.sectionHeaderHeight = 120
        mainTableView.rowHeight  = 50
        mainTableView.dataSource = self
        mainTableView.delegate   = self
        mainTableView.wy_registerCellClass(MenuTabCell.self)
        return mainTableView
    }()
    
    lazy fileprivate var footerView: MenuFooterView = {
        let footerView = MenuFooterView(frame: CGRect.zero)
        return footerView
    }()
     
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTabItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuTabCell =  tableView.wy_dequeueReusableCell(MenuTabCell.self)
        cell.model = menuTabItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.wy_cellForRow(MenuTabCell.self, indexPath: indexPath)
        cell.dotView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.wy_cellForRow(MenuTabCell.self, indexPath: indexPath)
        cell.dotView.isHidden = true
    }
    
}


