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
}
