//
//  Common.swift
//  NewPorject
//
//  Created by idea on 2018/4/24.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
//屏幕的宽度
let kScreenW = UIScreen.main.bounds.size.width
//屏幕的高度
let kScreenH = UIScreen.main.bounds.size.height
//判断设备是不是iPhoneSE
let kisSE = UIScreen.main.bounds.width == 320
//判断设备是不是iPhoneX
let kisX = UIScreen.main.bounds.height == 812


//客服号码
let kKefu = "0791-838888888"

let GfoodsUrl = "https://www.365greenlife.com/api/tiptop/v1/"
let token = "  "
let kJD = "http://139.199.169.203/"
//返回按钮
import Cupcake
class goBackBtn{
    func goBack(_ vc:UIViewController){
        let button = Button.bg("cyan").img("back").padding(10,10,10,15).onClick { (_) in
            vc.navigationController!.popViewController(animated: true)
        }
        let leftBarBtn = UIBarButtonItem(customView: button)
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
                                     action: nil)
        spacer.width = 0
        
        vc.navigationItem.leftBarButtonItems = [spacer, leftBarBtn]
    }
    
}
let leftBtn=goBackBtn()


//pod
//Using Alamofire (4.7.1)
//Using CYLTabBarController (1.17.6)
//Using Cupcake (1.2.1)
//Using Kingfisher (4.7.0)
//Using MBProgressHUD (1.1.0)
//Using MJRefresh (3.1.15.3)
//Installing Moya 11.0.2
//Using Result (3.2.4)
//Using RxCocoa (4.1.2)
//Using RxSwift (4.1.2)
//Using SwiftGifOrigin (1.6.1)
//Using SwiftyJSON (4.0.0)
