//
//  MenuHeaderView.swift
//  BeautifulDemo
//
//  Created by yu on 2019/3/8.
//  Copyright © 2019 yu. All rights reserved.
//

import UIKit
import SnapKit

class MenuHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconView)
        addSubview(nameLabel)
        addSubview(typeLabel)
        addSubview(loginButton)
        
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(25)
            make.top.equalTo(self).offset(30)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(15)
            make.top.equalTo(iconView.snp.top).offset(5)
            make.right.equalTo(self)
            make.height.equalTo(20)
        }
        
        typeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(15)
            make.centerY.equalTo(iconView.snp.centerY)
            make.height.equalTo(20)
        }
        
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ------------- Propertys ----------------------
    /// 头像
    fileprivate lazy var iconView: UIImageView = {
        var iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.setCornerRadius(25)
        return iconView
    }()
    /// 昵称
    fileprivate lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = UIColor.white
        nameLabel.textAlignment = .left
        nameLabel.font = UIConstant.FONT_14
        return nameLabel
    }()
    /// 用户类型
    fileprivate lazy var typeLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.textColor = UIColor.white
        typeLabel.textAlignment = .left
        typeLabel.font = UIConstant.FONT_12
        return typeLabel
    }()
    /// 登录按钮
    fileprivate lazy var loginButton: UIButton = {
        let loginButton = UIButton(type: .custom)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.setTitle("登录", for: .normal)
        loginButton.titleLabel?.font = UIConstant.FONT_16
        return loginButton
    }()

    

}

//MARK: ----------------Private Methods--------------------
extension MenuHeaderView {
    
    func configUI() {
        loginButton.isHidden = true
        iconView.image = Asset.detailPortraitDefault.image
        nameLabel.text = "wy"
        typeLabel.text = "微博美友"
        
    }
    
}
