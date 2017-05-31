//
//  NetworkTool.swift
//  Weibo
//
//  Created by dwt on 17/3/7.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import AFNetworking

enum requestType : Int {
    case GET = 0
    case POST
}

class NetworkTool: AFHTTPSessionManager {
    //let是线程安全的
    static let shareInstance : NetworkTool = {
       
        let tool = NetworkTool()
        tool.responseSerializer.acceptableContentTypes?.insert("text/html")
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tool
    }()
    
}


extension NetworkTool{
    
    func request(method:requestType, URLString:String, parameters:[String : AnyObject], completed:(result : AnyObject?, error : NSError?) -> ()){
        
        //定义成功回调的闭包
        let successCallBack = { (task : NSURLSessionDataTask, result : AnyObject?) -> Void in
            
            completed(result: result, error: nil)
            
        }
        
        //定义失败回调的闭包
        let failureCallBack =  { (task : NSURLSessionDataTask?, error : NSError) -> Void in
            
            completed(result: nil, error: error)
        }
        
        if method == .GET{
            
            GET(URLString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
            
        }else{
            
            POST(URLString, parameters: parameters, progress: nil, success: successCallBack, failure: failureCallBack)
    
        }
    }
}

//MARK:- 获取accessToken
extension NetworkTool{
    
    func loadAccessToken(code : String, finished:(result : [String : AnyObject]?, error : NSError?)->()){
        // 1.获取请求的URLString
        let urlString = "https://api.weibo.com/oauth2/access_token"
        
        // 2.获取请求的参数
        let parameters = ["client_id" : app_key, "client_secret" : app_secret, "grant_type" : "authorization_code", "redirect_uri" : redirect_uri, "code" : code]
        request(.POST, URLString: urlString, parameters: parameters) { (result, error) -> () in
            finished(result: result as? [String : AnyObject], error: error)
        }
    }
}

//MARK:-获取用户信息
extension NetworkTool{
    func loadUserInfo(accessToken:String, uid:String, finished : (result : [String : AnyObject]?, error : NSError?)->()){
        let urlString = "https://api.weibo.com/2/users/show.json"
        let parameters = ["urlString":urlString, "uid":uid]
        request(.GET, URLString: urlString, parameters: parameters) { (result, error) -> () in
            finished(result: result as? [String:AnyObject], error: error)
        }
    }
}

