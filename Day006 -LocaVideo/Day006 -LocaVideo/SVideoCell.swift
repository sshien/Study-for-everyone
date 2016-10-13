//
//  SVideoCell.swift
//  Day006 -LocaVideo
//
//  Created by 单志永 on 2016/10/13.
//  Copyright © 2016年 Mr.Shan. All rights reserved.
//

import UIKit
struct video {
    let image:String
    let title:String
    let source:String
}
class SVideoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var videoImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
