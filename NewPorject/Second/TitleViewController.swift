//
//  TitleViewController.swift
//  NewPorject
//
//  Created by idea on 2018/4/24.
//  Copyright © 2018年 idea. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Cupcake

class TitleViewController: UIViewController {
    var tableView:UITableView!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "音乐"
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
        let networkService = DoubanNetworkService()
        //        let data = loadData()
        let data = networkService.loadChannels()
        //        定义cell 将数据绑定到表格
        data.bind(to: tableView.rx.items){(tableView,row,element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = "\(element.name!)"
            cell.accessoryType = .disclosureIndicator //行末加箭头
            return cell
            }.disposed(by: disposeBag)
        //        cell点击
        tableView.rx.modelSelected(Channel.self)
            .map { $0.channelId! }
            .flatMap(networkService.loadFirstSong)
            .subscribe(onNext: { [weak self] song in
                let message = "歌手：\(song.artist!)\n歌曲：\(song.title!)"
                self?.showAlert(title:"歌曲信息",message:message)
            }).disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }
    
    //    弹出提示
    func showAlert(title:String,message:String){
        Alert.title(title).message(message).action("确定").show()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //获取列表数据
    /**
     func loadData() -> Observable<[[String : Any]]> {
     let data = ApiProvider.rx.request(.channels)
     .mapJSON()
     .map { data -> [[String:Any]] in
     if let json = data as?[String:Any],
     let channels = json["channels"] as? [[String:Any]]{
     return channels
     }else{
     return[]
     }
     }.asObservable()
     return data
     }
     */
}
