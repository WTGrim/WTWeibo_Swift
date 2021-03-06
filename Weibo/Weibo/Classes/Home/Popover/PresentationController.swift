//
//  PresentationController.swift
//  Weibo
//
//  Created by dwt on 17/3/4.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit


class PresentationController: UIPresentationController {

    private lazy var coverView = UIView()
    
    lazy var presentedFrame : CGRect = CGRectZero
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        presentedView()?.frame = presentedFrame
        
        setupCoverView()
    }
}


//MARK:- UI相关
extension PresentationController{
    
    private func setupCoverView(){
        coverView.backgroundColor = UIColor(white: 0.2, alpha: 0.4)
        containerView?.insertSubview(coverView, atIndex: 0)
        coverView.frame = containerView?.bounds ?? CGRectZero
        
        let tap = UITapGestureRecognizer(target: self, action: "tapAction")
        coverView .addGestureRecognizer(tap)
    }
}

//MARK:- 事件监听
extension PresentationController{
    
    @objc private func tapAction(){
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}