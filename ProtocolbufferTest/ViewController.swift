//
//  ViewController.swift
//  ProtocolbufferTest
//
//  Created by yoser on 2018/2/27.
//  Copyright © 2018年 yoser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建一个User的对象
        var user = User()
        user.email = "357997194@qq.com"
        user.id = 12
        user.name = "赵大宝"
        
        print(user)
        
        // 序列化User数据
        let data = try! user.serializedData()
        
        // 反序列化User数据
        let user2 = try! User(serializedData: data)
        
        print(user2)
        
    }


}

