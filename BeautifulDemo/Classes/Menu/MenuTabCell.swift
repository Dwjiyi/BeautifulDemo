//
//  MenuTabCell.swift
//  BeautifulDemo
//
//  Created by yu on 2019/3/14.
//  Copyright © 2019 yu. All rights reserved.
//

import UIKit

class MenuTabCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        selectionStyle = .none
        
        contentView.addSubview(dotView)
        contentView.addSubview(iconView)
        contentView.addSubview(titleLab)
        
        dotView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(15)
            make.centerY.equalTo(contentView.snp.centerY)
            make.size.equalTo(CGSize(width: 5, height: 5))
        }
        
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(30)
            make.centerY.equalTo(contentView.snp.centerY)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(15)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: MenuTabModel! {
        didSet {
            iconView.image = model.image
            titleLab.text = model.title
        }
    }
    
    //MARK: -------------------- Property --------------------------
    /// 图标
    fileprivate lazy var iconView: UIImageView = {
        var iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        return iconView
    }()
    
    /// 标题
    fileprivate lazy var titleLab: UILabel = {
        var titleLab = UILabel()
        titleLab.font = UIConstant.FONT_16
        titleLab.textColor = UIColor.white
        return titleLab
    }()
    
    /// 小圆点
    lazy var dotView: UIImageView = {
        var dotImageView = UIImageView(image: Asset.sidebarDot.image)
        dotImageView.frame = CGRect(x: 15, y: 145, width: 5, height: 5)
        dotImageView.isHidden = true
        return dotImageView
    }()
    

}
