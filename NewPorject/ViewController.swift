//
//  ViewController.swift
//  NewPorject
//
//  Created by idea on 2018/4/24.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import SwiftyJSON
import Cupcake

class ViewController: UIViewController {
    var lab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabUI()
        loadDataJD()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setupLabUI(){
        lab = Label.lines(0).bg("#96CDCD").border(2, "#EE6AA7").color("#FFFFFF").addTo(view).makeCons({ (make) in
            make.width.height.equal(self.view)
        })
    }
    func loadDataJD(){
        Network.request(.JD, success: { (json) in
            self.lab.str(json)
        }, error: { (statusCode) in
            //服务器报错等问题
            print("请求错误！错误码：\(statusCode)")
        }) { (error) in
            //没有网络等问题
            print("请求失败！错误信息：\(error.errorDescription ?? "")")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

