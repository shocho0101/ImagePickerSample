//
//  ViewController.swift
//  ImagePickerSample
//
//  Created by 張翔 on 2019/05/25.
//  Copyright © 2019 張翔. All rights reserved.
//

import UIKit
import DKImagePickerController //使用するライブラリをインポートする

class ViewController: UIViewController {
    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button() { //ボタンを押したときにpickerを表示する
        let pickerController = DKImagePickerController() //pickerを生成
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in //写真を選び終わったときの処理を設定する場所
            assets[0].fetchOriginalImage(completeBlock: { (image, _) in
                self.imageView1.image = image
            }) //選んだ写真のデータはassetsという配列に入って、このような感じでimageViewに表示することができます！
            assets[1].fetchOriginalImage(completeBlock: { (image, _) in
                self.imageView2.image = image
            })
            assets[2].fetchOriginalImage(completeBlock: { (image, _) in
                self.imageView3.image = image
            })
        }
        present(pickerController, animated: true, completion: nil) //写真
    }


}

