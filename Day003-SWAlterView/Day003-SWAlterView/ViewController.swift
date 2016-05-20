//
//  ViewController.swift
//  Day003-SWAlterView
//
//  Created by 单志永 on 5/18/16.
//  Copyright © 2016 Mr.Shan. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class ViewController: UIViewController, UIPopoverPresentationControllerDelegate{
    
    var alterViewController:UIAlertController!
    var action  = UIActionSheet()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setAlterViewController()
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - setUIAlerController
    func setAlterViewController() -> Void {
       
        alterViewController = UIAlertController(title: "提示", message: "alterController",preferredStyle: .Alert)
        //添加按键
        let actionCancel = UIAlertAction(title: "取消",style: .Cancel,handler: nil)

        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default) {
            (action: UIAlertAction!) -> Void in
           print("Ok")
        }
        alterViewController.addAction(actionCancel)
        alterViewController.addAction(okAction)
        //添加文本框
        alterViewController.addTextFieldWithConfigurationHandler { (textFile) in
            textFile.placeholder = "姓名"
        }
        alterViewController.addTextFieldWithConfigurationHandler { (textFile) in
            textFile.placeholder = "密码"
        }

        self.presentViewController(alterViewController, animated: true , completion: nil)
    }
    //MARK - setUIAlerController
    func setActionSheetViewController() -> Void {
        
        alterViewController = UIAlertController(title: "提示", message: "alterController",preferredStyle: .ActionSheet)
        //添加按键
        let actionCancel = UIAlertAction(title: "再见",style: .Cancel,handler: nil)
        
        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Default) {
            (action: UIAlertAction!) -> Void in
            print("Ok")
        }
        let okAction1 = UIAlertAction(title: "1", style: UIAlertActionStyle.Default) {
            (action: UIAlertAction!) -> Void in
            print("Ok")
        }
        let okAction2 = UIAlertAction(title: "2", style: UIAlertActionStyle.Default) {
            (action: UIAlertAction!) -> Void in
            print("Ok")
        }
        let okAction3 = UIAlertAction(title: "3", style: UIAlertActionStyle.Default) {
            (action: UIAlertAction!) -> Void in
            print("Ok")
        }
        alterViewController.addAction(actionCancel)
        alterViewController.addAction(okAction)
        alterViewController.addAction(okAction1)
        alterViewController.addAction(okAction2)
        alterViewController.addAction(okAction3)
        self.presentViewController(alterViewController, animated: true , completion: nil)
    }
    
    
    
    @IBAction func alterAction(sender: UIButton) {
        setAlterViewController()
        
        #if DEBUG
        
        #else
        
        #endif
        
    }
    
    @IBAction func alterClick(sender: UIButton) {
        setActionSheetViewController()
    }
    
    @IBAction func poAction(sender: UIButton) {
        let pop = PopViewController()
        pop.modalPresentationStyle = .Popover
        pop.popoverPresentationController?.delegate = self
        pop.popoverPresentationController?.sourceView = sender
        pop.popoverPresentationController?.sourceRect = sender.bounds
        pop.preferredContentSize = CGSizeMake(100, 100)
        pop.popoverPresentationController?.permittedArrowDirections = .Up
        self.presentViewController(pop, animated: true, completion: nil)
    }
    
}

