//
//  HomeCarCell.swift
//  Day007-CarDemo
//
//  Created by 单志永 on 2016/10/14.
//  Copyright © 2016年 Mr.Shan. All rights reserved.
//

import UIKit

let Identifier = "carCell"

class HomeCarCell: UICollectionViewCell {
    
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    
    
    
    var carModel:CarModel! {
        
        didSet{
            self.updateUI()
        }
    }
    
    fileprivate func updateUI(){

        self.carNameLabel.text = carModel.title
        self.carImageView.image = UIImage.init(named: carModel.image)
    }
    
    
    
}
