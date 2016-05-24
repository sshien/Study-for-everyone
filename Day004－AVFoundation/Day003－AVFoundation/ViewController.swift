//
//  ViewController.swift
//  Day003－AVFoundation
//
//  Created by 单志永 on 5/20/16.
//  Copyright © 2016 Mr.Shan. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var photoConstrainHeight: NSLayoutConstraint!
    @IBOutlet weak var pictrueView: UIImageView!
    let session = AVCaptureSession()
    var backCameraDvice:AVCaptureDevice!
    var frontCameraDvice:AVCaptureDevice!
    var previewLayer:AVCaptureVideoPreviewLayer!
    var imageOutput : AVCaptureStillImageOutput?
    var input  : AVCaptureDeviceInput!
    var output : AVCaptureMetadataOutput!
    var newVideoInput:AVCaptureDeviceInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSession()
        self.session.startRunning()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK:- 初始化session
    func initialSession() -> Void {
        input = try? AVCaptureDeviceInput(device: backCamera())
        imageOutput = AVCaptureStillImageOutput()
        imageOutput?.outputSettings = [AVVideoCodecJPEG:AVVideoCodecKey]
        if session.canAddInput(input)
        {
            session.addInput(input)
        }
        if session.canAddOutput(imageOutput)
        {
            session.addOutput(imageOutput)
        }
        
        //获取用户许可
        let authorizationStatus = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        switch authorizationStatus {
        case .NotDetermined://许可对话没有出现
            AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo,
                                                      completionHandler: { (granted:Bool) -> Void in
                                                        if granted {
                                                            // 继续
                                                            self.setUpCamerLayer()
                                                        }
                                                        else {
                                                            // 用户拒绝，无法继续
                                                            print("拒绝")
                                                        }
            })
        case  .Authorized://继续
            setUpCamerLayer()
            break
        case .Denied,.Restricted://用户明确的拒绝授权
            print("拒绝")
            break
        }

        
    }
    
    //MARK:- 获取前后摄像头的方法
    func cameraPosition(position:AVCaptureDevicePosition) -> AVCaptureDevice? {
        
        let avavilableCameraDevices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo)
        for device in avavilableCameraDevices as! [AVCaptureDevice]{
            if device.position == position{
                return device
            }
        }
        return nil
    }
    //前摄像头
    func frontCamera() -> AVCaptureDevice {
        return cameraPosition(.Front)!
    }
    //后摄像头
    func backCamera() -> AVCaptureDevice {
        return cameraPosition(.Back)!
    }
    //初始化相机画面
    func setUpCamerLayer() -> Void {
        if previewLayer == nil{
            previewLayer = AVCaptureVideoPreviewLayer(session:session)
            previewLayer.frame = CGRectMake(20, 20, 98,170 )
            previewLayer.borderWidth = 1
            previewLayer.borderColor = UIColor.greenColor().CGColor
            previewLayer.videoGravity = AVLayerVideoGravityResizeAspect
            view.layer.addSublayer(previewLayer)
            
        }
    }
    
    //MARk：－拍照
    func takePhoto() -> Void {
        let videoConnectoin = imageOutput?.connectionWithMediaType(AVMediaTypeVideo)
        guard  videoConnectoin != nil else{
            return
        }
        imageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnectoin, completionHandler: { (imageDataSampleBuffer, error) in
            guard imageDataSampleBuffer != nil else {
                return
            }
            
            let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataSampleBuffer)
            let image = UIImage(data: imageData)
            self.pictrueView.image = image
            //存入相册
            UIImageWriteToSavedPhotosAlbum(image!, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
            
        })
        
    }
    //判断相册是否存入成功
    func image(image: UIImage, didFinishSavingWithError: NSError?,contextInfo: AnyObject)
    {
        if didFinishSavingWithError != nil
        {
            print("error!")
            return
        }
        
        print("image was saved")
    }
    
    
    //MARK:- 切块镜头
    func changeCemera() -> Void {
        //获取摄像头数
        let cameraCount = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo).count
        guard cameraCount > 1 else {
            return
        }
        
        
        let position:AVCaptureDevicePosition = input.device.position
        
        if position == .Back {
            
            newVideoInput = try? AVCaptureDeviceInput(device: frontCamera())
        }else if position == .Front {
            
            newVideoInput = try? AVCaptureDeviceInput(device: backCamera())
        }
        
        guard newVideoInput != nil else {
            return
        }
        
        session.beginConfiguration()
        session.removeInput(input)
        if session.canAddInput(newVideoInput){
            session.addInput(newVideoInput)
            input = newVideoInput
        }else{
            session.addInput(input)
        }
        session.commitConfiguration()
        
    }
    
    

    //MARK:-  拍照
    @IBAction func takeCemera(sender: UIButton) {
        takePhoto()
    }
    //MARK:-切换摄像头
    @IBAction func changeCemare(sender: UIButton) {
        changeCemera()
    }
    
    
        
       

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

