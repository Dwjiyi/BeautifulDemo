//
//  MenuFooterView.swift
//  BeautifulDemo
//
//  Created by yu on 2019/3/22.
//  Copyright © 2019 yu. All rights reserved.
//

import UIKit

@objc protocol MenuFooterViewDelegate {
    func searchButtonDidClick()
    func settingButtonDidClick()
    func meetingButtonDidClick()
}


class MenuFooterView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(seperateLineView)
        addSubview(searchButton)
        addSubview(settingButton)
        addSubview(meettingButton)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout() {
        seperateLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self).offset(-5)
            make.height.equalTo(0.5)
        }
        
        searchButton.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.centerY.equalTo(self)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        settingButton.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-15)
            make.centerY.equalTo(self)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        meettingButton.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(self)
        }
    }
    
    @objc fileprivate func searchButtonDidClick(_ sender: UIButton) {
        delegate?.searchButtonDidClick()
    }
    
    @objc fileprivate func settingButtonDidClick(_ sender: UIButton) {
        delegate?.settingButtonDidClick()
    }
    
    @objc fileprivate func meetingButtonDidClick(_ sender: UIButton) {
        delegate?.meetingButtonDidClick()
    }
    
    
    //MARK: - Property
    weak var delegate: MenuFooterViewDelegate?
    /// 分割线
    lazy fileprivate var seperateLineView: UIView = {
        let seperateLineView = UIView()
        seperateLineView.backgroundColor = UIColor.white
        return seperateLineView
    }()
    
    /// 搜索按钮
    lazy fileprivate var searchButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(Asset.sidebarBottomiconSearchNormal.image, for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonDidClick(_:)), for: .touchUpInside)
        return searchButton
    }()
    
    /// 设置按钮
    lazy fileprivate var settingButton: UIButton = {
        let settingButton = UIButton(type: .custom)
        settingButton.setImage(Asset.sidebarIconMoreNormal.image, for: .normal)
        settingButton.addTarget(self, action: #selector(settingButtonDidClick(_:)), for: .touchUpInside)
        return settingButton
    }()
    
    /// 参加会议
    lazy fileprivate var meettingButton: UIButton = {
        let meettingButton = UIButton(type: .custom)
        meettingButton.setTitle("参加新生态未来峰会", for: .normal)
        meettingButton.setTitleColor(UIColor.white, for: .normal)
        meettingButton.titleLabel?.font = UIConstant.FONT_14
        meettingButton.addTarget(self, action: #selector(meetingButtonDidClick(_:)), for: .touchUpInside)
        return meettingButton
    }()

}
