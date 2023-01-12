//
//  ScannerViewController.swift
//  LightdowBuy
//
//  Created by Nick on 2023/1/9.
//

import UIKit
import AVFoundation

class ScannerViewController: UIViewController {
    
    // AVCaptureSession 用於捕捉視訊及音訊，協調視訊及音訊的輸入及輸出
    var captureSession: AVCaptureSession!
    
    // AVCaptureVideoPreviewLayer 呈現Session捕捉的資料
    var previewLayer: AVCaptureVideoPreviewLayer!
    var actionSheet: UIAlertController?
    var backPage: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

       
        setting() 
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }

    
    
    func setting() {
        
        view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        //AVCaptureDevice可以抓到相機和其屬性
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        //AVCaptureMetaDataOutput輸出影音資料，先實體化AVCaptureMetaDataOutput物件
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            //關鍵！執行緒處理QRCode
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            //metadataOutput.metadataObjectTypes表示要處理哪些類型的資料，處理QRCODE
            
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        
        //用AVCaptureVideoPreviewLayer來呈現Session上的資料
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        //呈現在view上面
        previewLayer.frame = view.layer.bounds
        
        //顯示size
        previewLayer.videoGravity = .resizeAspect
        
        //加入畫面
        view.layer.addSublayer(previewLayer)
        
        // 回上一頁
        backPage = UIButton(frame: CGRect(x: 15,y: 30,width: 40,height: 40))
       // captureButton.backgroundColor = UIColor.grayColor())
        let gobackpage: UIImage? = UIImage(named: "leftArrow")
        backPage?.setBackgroundImage(gobackpage, for: UIControl.State.normal)
        backPage.addTarget(self, action: #selector(backpageBtn), for: .touchUpInside)
        view.addSubview(backPage)
      
        
        
        //開始影像擷取呈現鏡頭的畫面
        captureSession.startRunning()
        
        
        
    }
    
    @objc func backpageBtn() {
    
        self.dismiss(animated: true, completion: nil)
        
      
    }
    
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    
    
    
}

extension ScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if let metadtaObject = metadataObjects.first {
            //AVMetadataMachineReadableCodeObject是從Output擷取到barcode內容
            guard let readableObject = metadtaObject as? AVMetadataMachineReadableCodeObject else { return }
            
            //將讀取到的內容轉成string
            guard let stringValue = readableObject.stringValue else { return }
            
            
            //掃到QRCode後的震動提示
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            // captureSession.stopRunning()
            
            //存取QRcodeURL
            found(code: stringValue)
           
            
        }
        // dismiss(animated: true)
        
    }
        
        // 將掃描後得url 跳出actionSheet，並點擊外開url
        func found(code: String) {
            print(code)
            
            let textUrl = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let content = UIAlertAction(title: code, style: .default) { (_) in
                 guard let url = URL(string: "\(code)") else { return }
                   UIApplication.shared.open(url)
              

            }
            
            textUrl.addAction(content)
            actionSheet = textUrl
            textUrl.popoverPresentationController?.sourceView = view
            textUrl.popoverPresentationController?.permittedArrowDirections = [.down]
            present(actionSheet!, animated: true, completion: nil)
            
        }
        
        
        
    
    
    // 隠藏「狀態欄」(目前無作用）
    //    override var prefersStatusBarHidden: Bool {
    //        return true
    //    }
    //
        
        // 指定視圖控制器支持的界面方向
        override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            
            // 縱向
            return .portrait
        }
        
        
}
