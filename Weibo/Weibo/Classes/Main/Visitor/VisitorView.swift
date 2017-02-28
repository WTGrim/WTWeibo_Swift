//
//  VisitorView.swift
//  Weibo
//
//  Created by dwt on 17/2/26.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    class func visitorView() -> VisitorView {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).first as! VisitorView
        
    }
    
    
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    //自定义函数
    func resetVisitorView(iconName:String, title:String){
        rotationView.hidden = true
        iconView.image = UIImage(named: iconName)
        titleLabel.text = title
    }
    
    //旋转动画方法
    func setRotationAnimation(){
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.repeatCount = MAXFLOAT
        animation.duration = 5
        //需要设置这个属性  不然退回后台或者切换页面动画会消失
        animation.removedOnCompletion = false
        
        rotationView.layer.addAnimation(animation, forKey: nil)
    }
}
