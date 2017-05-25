//
//  OAuthViewController.swift
//  Weibo
//
//  Created by dwt on 17/5/23.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {
    
    //MARK:-控件属性
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavgationBar()
        loadWeb()
    }
}


extension OAuthViewController{
    
    private func setupNavgationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "closeItemClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填充", style: .Plain, target: self, action: "fillItemClick")
        title = "登录页面"
    }
    
    private func loadWeb(){
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(app_key)&redirect_uri=\(redirect_uri)"
        guard let url = NSURL(string: urlString) else{
            return
        }
        let request = NSURLRequest(URL: url)
        webView.delegate = self
        webView .loadRequest(request)
    }
}

//MARK:- 事件点击
extension OAuthViewController{
    @objc private func closeItemClick(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @objc private func fillItemClick(){
        let jsCode = "document.getElementById('userId').value='1606020376@qq.com';document.getElementById('passwd').value='haomage';"
        
        // 2.执行js代码
        webView.stringByEvaluatingJavaScriptFromString(jsCode)
    }
}

//MARK:-webViewDelegate
extension OAuthViewController:UIWebViewDelegate{
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        guard let url = request.URL else{
            return true
        }
        
        let urlString = url.absoluteString
        
        //判断是够包含code=字符串 如果不包含就继续执行
        guard urlString.containsString("code=") else{
            return true
        }
        let code = urlString.componentsSeparatedByString("code=").last!
        print(code)
        loadRequest(code)
        return false
    }
}

extension OAuthViewController{
    private func loadRequest(code : String){
        NetworkTool.shareInstance.loadAccessToken(code) { (result, error) -> () in
            if error != nil{
                print(error)
                return
            }
            
            print(result)
        }
    }
}