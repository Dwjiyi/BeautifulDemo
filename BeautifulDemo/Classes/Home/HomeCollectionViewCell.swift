//
//  HomeCollectionViewCell.swift
//  BeautifulDemo
//
//  Created by yu on 2019/3/26.
//  Copyright © 2019 yu. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        layer.cornerRadius = 5
        
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(coverImageView)
        addSubview(detailLabel)
        addSubview(praiseCoverView)
        addSubview(praiseImageView)
        addSubview(praiseLabel)
        addSubview(authorNameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Property
    /// 标题
    fileprivate lazy var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIConstant.FONT_18
        titleLabel.textAlignment = .left
        return titleLabel
    }()
    
    /// 副标题
    fileprivate lazy var subTitleLabel: UILabel = {
        var subTitleLabel = UILabel()
        subTitleLabel.textColor = .darkGray
        subTitleLabel.textAlignment = .left
        subTitleLabel.font = UIConstant.FONT_14
        return subTitleLabel
    }()
    
    /// 图片
    lazy var coverImageView: UIImageView = {
        var coverImageView = UIImageView(image: Asset.homeLogoPressed.image)
        coverImageView.contentMode = .redraw
        return coverImageView
    }()
    
    /// 详情
    fileprivate lazy var detailLabel: UILabel = {
        
        var detailLabel = UILabel()
        detailLabel.textColor = .darkGray
        detailLabel.font = UIConstant.FONT_14
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .left
        return detailLabel
    }()
    
    /// 点赞数背景色
    fileprivate lazy var praiseCoverView: UIView = {
        var praiseCoverView = UIView()
        praiseCoverView.backgroundColor = UIColor.lightGray
        praiseCoverView.alpha = 0.5
        praiseCoverView.layer.cornerRadius = 10
        
        return praiseCoverView
    }()
    
    /// 点赞数图片
    fileprivate lazy var praiseImageView: UIImageView = {
        var praiseImageView = UIImageView(image: Asset.iconFlowerHomeLike.image)
        return praiseImageView
    }()
    
    /// 点赞数
    fileprivate lazy var praiseLabel: UILabel = {
        var praiseLabel = UILabel()
        praiseLabel.textColor = UIColor.white
        praiseLabel.textAlignment = .center
        praiseLabel.font = UIConstant.FONT_12
        return praiseLabel
    }()
    
    /// 作者名字
    fileprivate lazy var authorNameLabel: UILabel = {
        var authorNameLabel = UILabel()
        authorNameLabel.textColor = UIColor.black
        authorNameLabel.font = UIConstant.FONT_14
        authorNameLabel.textAlignment = .right
        return authorNameLabel
    }()

}
