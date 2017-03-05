//
//  PopoverAnimator.swift
//  Weibo
//
//  Created by dwt on 17/3/5.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

class PopoverAnimator: NSObject {
    
    private var isPresented:Bool = false
    
    lazy var presentedFrame:CGRect = CGRectZero
    
    //弹出和消失状态的回调
    var callBack:((presented:Bool)->())?

}


//MARK:- 协议代理方法
extension PopoverAnimator:UIViewControllerTransitioningDelegate{
    
    //弹出视图
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        let presentationVc = PresentationController(presentedViewController: presented, presentingViewController: presenting)
        presentationVc.presentedFrame = presentedFrame
        return presentationVc
    }
    
    //自定义弹出动画
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        callBack!(presented:isPresented)
        return self
    }
    
    //自定义消失动画
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        callBack!(presented: isPresented)
        return self
    }
}


//MARK:- 转场动画和小时动画的代理方法
extension PopoverAnimator: UIViewControllerAnimatedTransitioning{
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    //转场动画上下文：可以通过转场上下文获取弹出的view和消失的view
    // UITransitionContextFromViewKey, and UITransitionContextToViewKey
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        isPresented ? animationForPresented(transitionContext) : animationForDismiss(transitionContext)
    }
    
    //弹出动画
    private func animationForPresented(transitionContext: UIViewControllerContextTransitioning){
        //获取弹出的view
        let presentedView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        //将弹出的view添加到containerView中
        transitionContext.containerView()?.addSubview(presentedView)
        //执行动画
        presentedView.transform = CGAffineTransformMakeScale(1.0, 0.0)
        presentedView.layer.anchorPoint = CGPointMake(0.5, 0)
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            presentedView.transform = CGAffineTransformIdentity
            }) { (_) -> Void in
                transitionContext.completeTransition(true)
        }
    }
    
    //消失动画
    private func animationForDismiss(transitionContext: UIViewControllerContextTransitioning){
        
        let dismissView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            dismissView.transform = CGAffineTransformMakeScale(1.0, 0.00001)
            }) { (_) -> Void in
                dismissView.removeFromSuperview()
                transitionContext.completeTransition(true)
        }
        
    }
}
