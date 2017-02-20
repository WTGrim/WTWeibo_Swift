//
//  MainViewController.swift
//  Weibo
//
//  Created by dwt on 17/2/19.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //动态创建控制器  在项目开发中可以通过服务器返回的json文件动态创建
        guard let jsonPath = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil) else{
            return
        }
        guard let jsonData = NSData(contentsOfFile: jsonPath) else{
            return
        }
        
        //在调用系统方法时，方法最后有一个throws，说明该方法会抛出异常，需要对异常进行处理
        //在Swift中有三种处理方式
        /*
            1.try方式  程序员手动捕捉异常  do  try catch 方式 在实际开发中用的并不多
        */
        
        /*
            2.try?方式(常用)  系统帮助处理异常  如果该方法出现了异常 返回nil  如果没有异常返回对应对象(可选类型)
        */
        
        /*
            3.try!方式(不建议非常危险)  直接告诉系统 该方法没有异常·
        */
        guard let anyObject = try? NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers) else{
            return
        }
        guard let dictArray = anyObject as? [[String : AnyObject]] else{
            return
        }
        
        //遍历字典数组
        for dict in dictArray {
            
            guard let vcName = dict["vcName"] as? String else{
                continue
            }
            guard let title = dict["title"] as? String else {
                continue
            }
            guard let imageName = dict["imageName"] as? String else {
                continue
            }
            
            addChildViewController(vcName, title: title, image: imageName)
        }

    }
    
    //创建子控制器
    private func addChildViewController(childVcName: String, title:String, image:String) {
        
        //获取命名空间
        guard let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as? String else{
            return
        }
        //根据字符串创建对应的控制器
        guard let childVcClass = NSClassFromString(nameSpace + "." + childVcName) else{
            return
        }
        guard let childVcType = childVcClass as? UIViewController.Type else{
            return
        }
        
        //创建对应的控制器
        let childVc = childVcType.init()
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: image)
        childVc.tabBarItem.selectedImage = UIImage(named: image + "_highlighted")
        let childNav = UINavigationController(rootViewController: childVc)
        addChildViewController(childNav)
    }
}
