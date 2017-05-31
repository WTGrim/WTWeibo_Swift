//
//  BaseViewController.swift
//  Weibo
//
//  Created by dwt on 17/2/26.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    
    //对登录与否进行判断，并且加载对应的视图
    var isLogin:Bool = UserAccountViewModel.shareInstance.isLogin
    var visitorView:VisitorView = VisitorView.visitorView()
    
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航栏
        setupNavigationItems()
    }


}


//MARK:- UI界面设置
extension BaseViewController {
    
    //设置访客视图
    private func setupVisitorView(){
        view = visitorView
        visitorView.registerBtn.addTarget(self, action: "leftBtnItemClick", forControlEvents: .TouchUpInside)
        visitorView.loginBtn.addTarget(self, action: "rightBtnItemClick", forControlEvents: .TouchUpInside)
    }
    
    //设置导航栏items
    private func setupNavigationItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "leftBtnItemClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: "rightBtnItemClick")
    }
}

//MARK:- 事件监听
extension BaseViewController{
    
    @objc private func leftBtnItemClick(){
        print("点击了左边")
    }
    
    @objc private func rightBtnItemClick(){
        print("点击了右边")
        let oauthVc = OAuthViewController()
        let oauthNav = UINavigationController(rootViewController: oauthVc)
        presentViewController(oauthNav, animated: true, completion: nil)
    }
}

