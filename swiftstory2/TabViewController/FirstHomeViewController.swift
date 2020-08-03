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
        print(kScreenW,kScreenH)
        view.addSubview(button)
    }

    private lazy var button : UIButton = {

        let btn=UIButton.init(type:.roundedRect)
        btn.frame = CGRect(x: 10, y: 300, width: kScreenW-20, height: 100)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return btn
    }()

    @objc private func btnClick(){
        print(123)
    }
}

