//
//  MainViewController.swift
//  Weibo
//
//  Created by dwt on 17/2/19.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    //MARK:- 懒加载属性
    private lazy var imageNames = ["tabbar_home", "tabbar_message_center", "", "tabbar_discover", "tabbar_profile"]
    private lazy var composeButton = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setComposeBtn()
        
        
        
        //纯代码创建
//        //动态创建控制器  在项目开发中可以通过服务器返回的json文件动态创建
//        guard let jsonPath = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil) else{
//            return
//        }
//        guard let jsonData = NSData(contentsOfFile: jsonPath) else{
//            return
//        }
//        
//        //在调用系统方法时，方法最后有一个throws，说明该方法会抛出异常，需要对异常进行处理
//        //在Swift中有三种处理方式
//        /*
//            1.try方式  程序员手动捕捉异常  do  try catch 方式 在实际开发中用的并不多
//        */
//        
//        /*
//            2.try?方式(常用)  系统帮助处理异常  如果该方法出现了异常 返回nil  如果没有异常返回对应对象(可选类型)
//        */
//        
//        /*
//            3.try!方式(不建议非常危险)  直接告诉系统 该方法没有异常·
//        */
//        guard let anyObject = try? NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers) else{
//            return
//        }
//        guard let dictArray = anyObject as? [[String : AnyObject]] else{
//            return
//        }
//        
//        //遍历字典数组
//        for dict in dictArray {
//            
//            guard let vcName = dict["vcName"] as? String else{
//                continue
//            }
//            guard let title = dict["title"] as? String else {
//                continue
//            }
//            guard let imageName = dict["imageName"] as? String else {
//                continue
//            }
//            
//            addChildViewController(vcName, title: title, image: imageName)
//        }
//
//    }
//    
//    //创建子控制器
//    private func addChildViewController(childVcName: String, title:String, image:String) {
//        
//        //获取命名空间
//        guard let nameSpace = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as? String else{
//            return
//        }
//        //根据字符串创建对应的控制器
//        guard let childVcClass = NSClassFromString(nameSpace + "." + childVcName) else{
//            return
//        }
//        guard let childVcType = childVcClass as? UIViewController.Type else{
//            return
//        }
//        
//        //创建对应的控制器
//        let childVc = childVcType.init()
//        childVc.title = title
//        childVc.tabBarItem.image = UIImage(named: image)
//        childVc.tabBarItem.selectedImage = UIImage(named: image + "_highlighted")
//        let childNav = UINavigationController(rootViewController: childVc)
//        addChildViewController(childNav)
    }
    
    //MARK:- 需要在这里进行items的设置
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setItems()
    }
}

extension MainViewController{
    
    private func setComposeBtn() {
        //设置中间按钮
//        composeButton.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState:.Normal)
//        composeButton.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
//        composeButton.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
//        composeButton.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
//        composeButton.sizeToFit()
        composeButton.center = CGPointMake(tabBar.center.x, tabBar.bounds.size.height * 0.5)
        tabBar.addSubview(composeButton)
        composeButton.addTarget(self, action: "composeButtonClick", forControlEvents: .TouchUpInside)
    }
    
    private func setItems() {
        
        //通过storyboard创建
        for i in 0 ..< tabBar.items!.count{
            
            //获取item
            let item = tabBar.items![i]
            if i == 2 {
                item.enabled = false
                continue
            }
            item.selectedImage = UIImage(named: imageNames[i] + "_highlighted")
        }
    }
}

//事件监听
extension MainViewController{
    
    //事件监听 如果用private修饰那么不会添加到方法列表中，可以用@objc修饰，既保证了方法外界不能访问，同时添加到方法列表中，调用方法时不会发生崩溃
    @objc private func composeButtonClick(){
        
        print("点击了发布按钮")
    }
    
}

