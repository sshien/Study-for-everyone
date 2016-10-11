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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //恢复默认状态
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGray
        self.navigationController?.navigationBar.tintColor    = UIColor.blue
        self.navigationController?.navigationBar.backIndicatorImage = nil
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = nil
        self.navigationController?.navigationBar.titleTextAttributes = nil
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier"+"\((indexPath as NSIndexPath).row+1)", for: indexPath)
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        swStyleNavigationBar(indexPath)
    }
    
    //MARK:- 选择不同的风格
    func swStyleNavigationBar(_ index:IndexPath) -> Void {
        
        let  swVC = SWViewController()
        
        switch (index as NSIndexPath).row {
            
        case 0: swVC.style = .default
        case 1: swVC.style = .backgroundImage
        case 2: swVC.style = .backgroundColor
        case 3: swVC.style = .titleView
        case 4: swVC.style = .textAttribute
        case 5: swVC.style = .backButtonTintColor
        case 6: swVC.style = .buttonImage
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
