//
//  MainViewController.swift
//  Weibo
//
//  Created by dwt on 17/2/19.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(HomeViewController(), title: "首页", image: "tabbar_home")
        addChildViewController(MessageViewController(), title: "消息", image: "tabbar_message_center")
        addChildViewController(DiscoverViewController(), title: "发现", image: "tabbar_discover")
        addChildViewController(ProfileViewController(), title: "我", image: "tabbar_profile")
    }
    
    //创建子控制器
    private func addChildViewController(childController: UIViewController, title:String, image:String) {
        
        let childVc = HomeViewController()
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: image)
        childVc.tabBarItem.selectedImage = UIImage(named: image + "_highlighted")
        let childNav = UINavigationController(rootViewController: childVc)
        addChildViewController(childNav)
    }
}
