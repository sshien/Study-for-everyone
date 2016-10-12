//
//  ViewController.swift
//  Day005-TimeLabe
//
//  Created by 单志永 on 2016/10/11.
//  Copyright © 2016年 Mr.Shan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    let defaultString = "0.0"  //默认字符串
    var defaultTime   = 0.0
    var timeBool      = true
    
    //懒加载定时器
    lazy var timer:Timer = {[unowned self] in
        
        var theTimer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                            selector:#selector(self.timeRepeatAction) ,
                                            userInfo: nil, repeats: true)
        RunLoop.main.add(theTimer, forMode: .defaultRunLoopMode)
        return theTimer
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func configrarionTimer() {
        
    }
    
    //MARK:- 定时器方法
    func timeRepeatAction() -> Void {
        defaultTime += 0.1
        self.timeLabel.text = "\(defaultTime)"
    }
    
    //MARK:- 开始
    @IBAction func playAction(_ sender: UIButton) {
        if timeBool {
            timer.fireDate = NSDate.distantPast
        }
        timeBool = false
    }
    //MARK:- 暂停
    @IBAction func stopAction(_ sender: UIButton) {
        
        if !timeBool {
           self.timer.fireDate = NSDate.distantFuture
        }
        timeBool = true
    }
    //MARK:- 重置
    @IBAction func resetAction(_ sender: UIButton) {
        self.timer.fireDate = NSDate.distantFuture
        timeBool = true
        defaultTime = 0.0
        self.timeLabel.text = defaultString
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

