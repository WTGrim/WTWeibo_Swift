//
//  NetworkTool.swift
//  Weibo
//
//  Created by dwt on 17/3/7.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import AFNetworking

class NetworkTool: AFHTTPSessionManager {
    //let是线程安全的
    static let shareInstance : NetworkTool = NetworkTool()
    
}
