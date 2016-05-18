//
//  FirstViewController.swift
//  Day002-SWNavigationBar
//
//  Created by 单志永 on 5/17/16.
//  Copyright © 2016 Mr.Shan. All rights reserved.
//

import UIKit

let kNavigationBarHeight:CGFloat = 50

class FirstViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         self.tableView.delegate = self
        scrollViewDidScroll(self.tableView)
        self.navigationController?.navigationBar.shadowImage = UIImage()//去除黑线
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tableView.delegate = nil
        self.navigationController?.navigationBar.sSReset()
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let color  = UIColor.orangeColor()
        let offsetY = scrollView.contentOffset.y
            if offsetY>=kNavigationBarHeight {
                let alpha:CGFloat = min(1, 1-(kNavigationBarHeight+64-offsetY)/64)
                self.navigationController?.navigationBar.sWSetBackgroundColor(color.colorWithAlphaComponent(alpha))
            }else{
                self.navigationController?.navigationBar.sWSetBackgroundColor(color.colorWithAlphaComponent(0))
            }
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 20
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Identifier", forIndexPath: indexPath)
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

