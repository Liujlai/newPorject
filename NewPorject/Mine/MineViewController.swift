//
//  MineViewController.swift
//  NewPorject
//
//  Created by idea on 2018/4/24.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import Cupcake

class MineViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我的"
        setupUI()
        loadData()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
//MARK： 设置UI界面
extension MineViewController{
    override func setupUI(){
        //        添加加载动画
        //        给contenView进行赋值
        contenView = GroupTable(
            Row.custom({ row in
                let icon = ImageView.pin(60, 60).img("userIcon")
                let title = Label.str("fdsfds").font("15")
                let cops = Label.str("手机号").font(13)
                let status = Label.str("13699999999999").font(13)
                
                
                let desc = Label.str("sasas").lines().onLink({ text in
                    print(text)
                })
                
                let head = HStack( icon, VStack(title, cops, status).gap(2) ).gap(10)
                VStack(head, 12, desc).embedIn(row.cell.contentView, 10, 15)
            }).height(-1).arrow(),
            
            Section(
                Row.str("任务中心").detail("detail3").style(.subtitle),
                Row.str("客服")
                ).header(20),
            
            Row.custom({ row in
                Label.str("退出").color("red").align(.center).embedIn(row.cell.contentView)
            })
            
            ).embedIn(self.view)
        super.setupUI()
    }
}
extension MineViewController{
    fileprivate func loadData(){
        //            3.数据请求完成
        DispatchQueue.global(qos: .default).asyncAfter(deadline: DispatchTime.now()+2.0){
            //执行完毕，主线程更新
            DispatchQueue.main.async {
            self.loadDataFinished()
            }
        }
        
    }
}
