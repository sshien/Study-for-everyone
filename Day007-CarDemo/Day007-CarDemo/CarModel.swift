//
//  CarModel.swift
//  Day007-CarDemo
//
//  Created by 单志永 on 2016/10/14.
//  Copyright © 2016年 Mr.Shan. All rights reserved.
//

import UIKit

class CarModel: NSObject {

    var image = ""
    var title = ""
   
    
    init(image:String, title:String) {
    
        self.image = image
        self.title = title
    }
    
    
    static func creatCarModel()->[CarModel]{
        return [
        CarModel(image:"MB1",title:"测试"),
        CarModel(image:"MB2",title:"测试"),
        CarModel(image:"MB3",title:"测试"),
        CarModel(image:"MB4",title:"测试")]
        
    }
    
}
