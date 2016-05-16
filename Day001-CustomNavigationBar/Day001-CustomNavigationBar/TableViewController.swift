//
//  TableViewController.swift
//  Day001-CustomNavigationBar
//
//  Created by 单志永 on 5/16/16.
//  Copyright © 2016 Mr.Shan. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //恢复默认状态
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGrayColor()
        self.navigationController?.navigationBar.tintColor    = UIColor.blueColor()
        self.navigationController?.navigationBar.backIndicatorImage = nil
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = nil
        self.navigationController?.navigationBar.titleTextAttributes = nil
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier"+"\(indexPath.row+1)", forIndexPath: indexPath)
        return cell
    }
 
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        swStyleNavigationBar(indexPath)
    }
    
    //MARK:- 选择不同的风格
    func swStyleNavigationBar(index:NSIndexPath) -> Void {
        
        let  swVC = SWViewController()
        
        switch index.row {
            
        case 0: swVC.style = .Default
        case 1: swVC.style = .BackgroundImage
        case 2: swVC.style = .BackgroundColor
        case 3: swVC.style = .TitleView
        case 4: swVC.style = .TextAttribute
        case 5: swVC.style = .BackButtonTintColor
        case 6: swVC.style = .ButtonImage
        case 7: swVC.style = .addMoreItems
        default:
            fatalError("矮油！好像没有选项～")
        }
        
        self.navigationController?.pushViewController(swVC, animated: true)
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
