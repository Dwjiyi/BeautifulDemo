//
//  MenuTabModel.swift
//  BeautifulDemo
//
//  Created by yu on 2019/3/13.
//  Copyright © 2019 yu. All rights reserved.
//

import UIKit

struct MenuTabModel {
    let image: UIImage
    let title: String
}

let menuTabItems = [
    MenuTabModel(image: Asset.sidebarIconAppsNormal.image , title: "每日最美"),
    MenuTabModel(image: Asset.sidebarIconBoxNormal.image , title: "限免推荐"),
    MenuTabModel(image: Asset.sidebarIconDiscoverNormal.image , title: "发现应用"),
    MenuTabModel(image: Asset.sidebarIconArticleNormal.image , title: "文章专栏"),
    MenuTabModel(image: Asset.sidebarIconBeautyNormal.image , title: "美我一下"),
    MenuTabModel(image: Asset.sidebarIconFavNormal.image , title: "我的收藏")
]
