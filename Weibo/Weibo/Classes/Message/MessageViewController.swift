//
//  MessageViewController.swift
//  Weibo
//
//  Created by dwt on 17/2/19.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        visitorView.resetVisitorView("visitordiscover_image_message", title: "登录后，别人评论你的微博，给你发消息，都会在这里收到通知")
    }
}
