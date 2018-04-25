//
//  HomeViewController.swift
//  NewPorject
//
//  Created by idea on 2018/4/24.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import SwiftGifOrigin
import Cupcake

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页"
        
        let jeremyGif = ImageView.pin(.xy(10, 44)).addTo(view)
        jeremyGif.image = UIImage.gif(name: "heibai")
        
        let imageView = UIImageView().pin(.maxXY(-10, -44)).addTo(view)
        imageView.loadGif(name: "heibai")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        MBProgressHUD.showInfo("点击屏幕")
    }
}
