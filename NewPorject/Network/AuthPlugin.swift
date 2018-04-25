//
//  AuthPlugin.swift
//  NewPorject
//
//  Created by idea on 2018/4/24.
//  Copyright © 2018年 idea. All rights reserved.
//

import Foundation
import Moya

struct AuthPlugin: PluginType {
    //令牌字符串
    let token: String
    
    //准备发起请求
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        //将token添加到请求头中
        request.timeoutInterval = 5 ////设置请求超时时间
        //        request.addValue(token, forHTTPHeaderField: "token")
        return request
    }
}
