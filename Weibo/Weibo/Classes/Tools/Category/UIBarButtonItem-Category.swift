//
//  UIBarButtonItem-Category.swift
//  Weibo
//
//  Created by dwt on 17/2/28.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    convenience init(imageName:String) {
        self.init()
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), forState: .Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        btn.sizeToFit()
        
        customView = btn
    }
}