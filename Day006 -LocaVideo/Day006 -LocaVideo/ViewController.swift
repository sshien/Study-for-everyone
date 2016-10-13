//
//  ViewController.swift
//  Day006 -LocaVideo
//
//  Created by 单志永 on 2016/10/13.
//  Copyright © 2016年 Mr.Shan. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


let IdenfiterCell = "IdenfiterCell"


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    var dataArray = [
        video(image: "IMG_1932", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "IMG_1933", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "IMG_1934", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "IMG_1935", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "IMG_1936", title: "Facebook HQ", source: "Facebook - 10:20"),

    ] //地址数组

    
    @IBOutlet weak var videoTableView: UITableView!
    var palyViewController = AVPlayerViewController()
    var playerView = AVPlayer()
   
    

    //MARK:- TableViewDelegate && TabelViewDateSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let videoPath = Bundle.main.path(forResource: "QFVideo", ofType: "mp4")
        playerView = AVPlayer(url: URL(fileURLWithPath: videoPath!))
        palyViewController.player = playerView
        self.present(palyViewController, animated: true) { 
            self.palyViewController.player?.play()
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 128
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: IdenfiterCell, for: indexPath)
        as! SVideoCell
        let aVideo = dataArray[indexPath.row]
        tableViewCell.videoImage.image = UIImage.init(named: aVideo.image)
        return tableViewCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

