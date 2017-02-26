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
    var isLogin:Bool = false
    var visitorView:UIView = VisitorView.visitorView()
    
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}


extension BaseViewController {
    
    private func setupVisitorView(){
        visitorView.backgroundColor = UIColor.purpleColor()
        view = visitorView
    }
}