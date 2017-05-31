//
//  UserAccountTool.swift
//  Weibo
//
//  Created by dwt on 17/5/31.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

//没有用到kvc，可以不继承自NSObject，更加轻量
class UserAccountViewModel{

    //单例
    static let shareInstance : UserAccountViewModel = UserAccountViewModel()
    var account : UserAccount?
    //计算属性
    var isLogin : Bool{
        if account == nil{
            return false
        }
        guard let expireDate = account?.expires_date else{
            return false
        }
        return expireDate.compare(NSDate()) == NSComparisonResult.OrderedDescending
    }
    //计算属性
    var accountPath : String{
        let accountPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        return (accountPath as NSString).stringByAppendingPathComponent("account.plist")
    }
    //重写init
    init(){
        account = NSKeyedUnarchiver.unarchiveObjectWithFile(accountPath) as? UserAccount
    }
}
