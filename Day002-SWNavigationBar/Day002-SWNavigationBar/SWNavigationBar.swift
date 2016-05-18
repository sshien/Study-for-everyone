//
//  SWNavigationBar.swift
//  Day002-SWNavigationBar
//
//  Created by 单志永 on 5/17/16.
//  Copyright © 2016 Mr.Shan. All rights reserved.
//

import Foundation
import UIKit




extension UINavigationBar{
    
    private struct AssociatedKeys{
        static var overLayKey = "overLayKey"
    }
    
    var overLayer:UIView?{
        
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.overLayKey) as? UIView
        }
        
        set {
            if let newValue = newValue{
                objc_setAssociatedObject(self, &AssociatedKeys.overLayKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    func sWSetBackgroundColor(backgroundColor:UIColor) -> Void {
        
       
        if (self.overLayer == nil) {
            self.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            self.overLayer = UIView(frame:CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20))
            self.overLayer?.tag = 10012
            self.overLayer?.userInteractionEnabled = false
            self.overLayer?.autoresizingMask       = [UIViewAutoresizing.FlexibleWidth,UIViewAutoresizing.FlexibleHeight]
            self.insertSubview(self.overLayer!, atIndex: 0)
        }else if self.overLayer?.superview != self{
            self.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            self.insertSubview(self.overLayer!, atIndex: 0)
        }
        self.overLayer?.backgroundColor = backgroundColor
    }
    
    func sWSetTransltionY(translationY:CGFloat) -> Void {
        
        self.transform = CGAffineTransformMakeTranslation(0, translationY)
    }
    
    func sWSetElementsAlpha(alpha:CGFloat) -> Void {
        
        for (_,object) in (self.valueForKey("_leftViews") as! [UIView]).enumerate(){
            object.alpha = alpha
        }
        for (_,object) in (self.valueForKey("_rightViews") as! [UIView]).enumerate(){
            object.alpha = alpha
        }
        
        let titleView = self.valueForKey("_titleView") as! UIView
        titleView.alpha = alpha
        
        for (_,object) in self.subviews.enumerate() {
            if object.isKindOfClass(NSClassFromString("UINavigationItemView")!){
                object.alpha = alpha
            }
        }
        
    }
    
    func sSReset() -> Void {
        self.setBackgroundImage(nil, forBarMetrics: .Default)
        self.overLayer?.removeFromSuperview()
        self.overLayer = nil
        
        
    }
    

    
}