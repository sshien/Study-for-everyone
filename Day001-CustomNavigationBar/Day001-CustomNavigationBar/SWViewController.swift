//
//  SWViewController.swift
//  Day001-CustomNavigationBar
//
//  Created by 单志永 on 5/16/16.
//  Copyright © 2016 Mr.Shan. All rights reserved.
//

import UIKit

/*
  注意：以下所有方法都在在appDeleagte 里面用 UINavigationBar.appearance() 设置
 
 例如: UINavigationBar.appearance().tintColor = UIColor.redColor
 
 
 */






enum SWNavtionStyle {
    case `default`
    case backgroundColor
    case backgroundImage
    case addMoreItems
    case backButtonTintColor
    case buttonImage
    case textAttribute
    case titleView
}

class SWViewController: UIViewController {
    

    var style:SWNavtionStyle! = .default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = UIColor.white
        self.title = "定制导航栏标题"
        setStyle(self.style)
        // Do any additional setup after loading the view.
    }

    
    //MARK:- 设置导航栏样式
    func setStyle(_ aStyle:SWNavtionStyle) -> Void {
        
        switch aStyle {
        case .default:
            defaultStyle()
            
        case .addMoreItems:
            addMoreBatItem()
            
        case .buttonImage:
            setButtonImage()
            
        case .backgroundColor:
            backgroundColor()
            
        case .backButtonTintColor:
            backButtonTintColor()
            
        case .textAttribute:
            setNavigationTextAttribute()
            
        case .backgroundImage:
            backgroundImageStyle()
            
        case .titleView:
            setTitltView()
        }
        
    }
    
    //MARK:- Defual
    func defaultStyle() -> Void {
        self.title  = "默认"
    }
    //MARK:- BackgroundImage
    func backgroundImageStyle() -> Void {
        self.title = "设置导航栏图片"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "nav_bg_ios7.png"), for: .default)
    }
    
    //MARK:- backgroundColor
    func backgroundColor() -> Void {
        self.title  = "设置背景颜色"
        //如果你设置过图片，那么就要写这部，反之亦然
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        //#iOS7中设置bar背景颜色改为 barTintColor
        self.navigationController?.navigationBar.barTintColor = UIColor.yellow
    }
    
    //MARK:- backButtonColor 设置返回键颜色
    func backButtonTintColor() -> Void {
        self.title  = "设置返回键颜色"
        self.navigationController?.navigationBar.tintColor = UIColor.green
        //或者这种
        UINavigationBar.appearance().tintColor  =  UIColor.green

    }
    
    //设置返回键图片样式
    func setButtonImage() -> Void {
        self.title  = "设置返回键图片"
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back_btn.png")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back_btn.png")
    }
    
    //修改导航栏字体
    /*
     - UITextAttributeFont – 字体key
     - UITextAttributeTextColor – 文字颜色key
     - UITextAttributeTextShadowColor – 文字阴影色key
     - UITextAttributeTextShadowOffset – 文字阴影偏移量key
     */
    func setNavigationTextAttribute() -> Void {
        
        let shadow = NSShadow()
        shadow.shadowColor  = UIColor.darkGray
        shadow.shadowOffset = CGSize(width: 0, height: 1)
        
        //MARK:=
        let attributes:[String:AnyObject] = [NSForegroundColorAttributeName:UIColor.red,
                                             NSFontAttributeName: UIFont(name: "AmericanTypewriter-Bold", size: 22)!,
                                             NSShadowAttributeName:shadow]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
    }
    
    //MARK:- 添加多个按键
    func addMoreBatItem() -> Void {
        self.title  = "添加多个按键"
        let shareItem = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action: nil)
        let camerItem = UIBarButtonItem.init(barButtonSystemItem: .camera, target: self, action: nil)
        let itmes = [shareItem,camerItem]
        self.navigationItem.rightBarButtonItems = itmes
    }
    
    //MARK:- 设置titleView
    func setTitltView() -> Void {
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "appcoda-logo.png"))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
