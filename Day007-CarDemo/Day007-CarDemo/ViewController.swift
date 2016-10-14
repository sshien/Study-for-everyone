//
//  ViewController.swift
//  Day007-CarDemo
//
//  Created by 单志永 on 2016/10/14.
//  Copyright © 2016年 Mr.Shan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    fileprivate var dataArray = CarModel.creatCarModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let carCell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier, for: indexPath) as! HomeCarCell
        carCell.carModel = dataArray[indexPath.row]
        return carCell
    }
}
