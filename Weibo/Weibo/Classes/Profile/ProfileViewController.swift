//
//  ProfileViewController.swift
//  Weibo
//
//  Created by dwt on 17/2/19.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        visitorView.resetVisitorView("visitordiscover_image_profile", title: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
    }

}
