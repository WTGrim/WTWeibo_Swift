//
//  UIButton-Category.swift
//  Weibo
//
//  Created by dwt on 17/2/26.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit


extension UIButton{
    
    /*
    //通过类方法进行创建
    class func createBtn(imageName:String, bgImageName:String) -> UIButton {
        
        let btn = UIButton()
        btn .setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        btn.setBackgroundImage(UIImage(named: bgImageName), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: bgImageName + "_highlighted" ), forState: .Highlighted)
        btn.sizeToFit()
        return btn
    }
    */

    
    //通过便利构造函数进行创建
    /*
        1.便利构造函数是用于对系统的类进行构造函数的扩充，放在extension里面
        2.需要调用self.init
        3.便利构造函数需要在init前面加上convenience
    */
    
    convenience init(imageName:String, bgImageName:String){
        
        self.init()
        setImage(UIImage(named: imageName), forState: .Normal)
        setImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        setBackgroundImage(UIImage(named: bgImageName), forState: .Normal)
        setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), forState: .Highlighted)
        sizeToFit()
    }
}