//
//  UserAccount.swift
//  Weibo
//
//  Created by dwt on 17/5/30.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

class UserAccount: NSObject , NSCoding{

    var access_token : String?
    var expires_in : NSTimeInterval = 0.0{
        //MARK:-属性监听改变
        didSet{
            expires_date = NSDate(timeIntervalSinceNow: expires_in) //将秒转成NSDate类型
        }
    }
    var uid : String?
    var expires_date : NSDate?
    /// 昵称
    var screen_name : String?
    /// 用户的头像地址
    var avatar_large : String?
    
    
    //MARK:-自定义构造函数
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    //MARK:-重写description属性
    override var description:String{
        return dictionaryWithValuesForKeys(["access_token", "expires_date", "uid", "screen_name", "avatar_large"]).description
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeObject(expires_date, forKey: "expires_date")
        aCoder.encodeObject(uid, forKey: "uid")
        aCoder.encodeObject(avatar_large, forKey: "avatar_large")
        aCoder.encodeObject(screen_name, forKey: "screen_name")
    }
    
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_date = aDecoder.decodeObjectForKey("expires_date") as? NSDate
        uid = aDecoder.decodeObjectForKey("uid") as? String
        avatar_large = aDecoder.decodeObjectForKey("avatar_large") as? String
        screen_name = aDecoder.decodeObjectForKey("screen_name") as? String
    }
}
