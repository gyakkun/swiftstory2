//
//  FirstHomeViewController.swift
//  swiftstory2
//
//  Created by gyakkun on 2020/7/13.
//  Copyright © 2020 gyakkun. All rights reserved.
//

import UIKit
import SwiftyJSON

class FirstHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let dict = ["id": "xiaowufeixia"]

        self.view.backgroundColor = RGBColor(r: 15, g: 175, b: 240)
//        print("entering http request")
//        HttpDatas.shareInstance.requestData(.get, URLString: "https://api.bgm.tv/user/xiaowufeixia",
//                parameters: dict, finishCallBack: {
//            (response) in
//            let jsonData = JSON(response)
//            print("jsonData: \(jsonData)")
//        })
//
//        print("end of http request")

    }


}

