//
//  SecondViewController.swift
//  Day002-SWNavigationBar
//
//  Created by 单志永 on 5/17/16.
//  Copyright © 2016 Mr.Shan. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.sSReset()
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY > 0 {
            if offsetY>=44 {
                self.setNavigationBarTransformProgress(1)
            }else{
                self.setNavigationBarTransformProgress(offsetY/44)
            }
        }else{
            self.setNavigationBarTransformProgress(0)
            self.navigationController?.navigationBar.backIndicatorImage = UIImage()
        }
    }
    
    func setNavigationBarTransformProgress(progress:CGFloat) -> Void {
        self.navigationController?.navigationBar.sWSetTransltionY(-44*progress)
        self.navigationController?.navigationBar.sWSetElementsAlpha(1-progress)
    }
}

