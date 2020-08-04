//
//  FourthMineViewController.swift
//  swiftstory2
//
//  Created by gyakkun on 2020/7/21.
//  Copyright © 2020 gyakkun. All rights reserved.
//

import UIKit

class FourthMineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(grayView)
        print(kScreenW,kScreenH)
        // Do any additional setup after loading the view.
    }

    private lazy var button : UIButton = {

        let btn=UIButton.init(type:.roundedRect)
        btn.frame = CGRect(x: 10, y: 300, width: kScreenW-20, height: 100)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return btn
    }()

    @objc private func btnClick(){
        print("[btnClick] btn clicked.")
        grayView.alpha = 1.0
    }

    private lazy var grayView : UIView = {
        let gray = UIView.init(frame: self.view.bounds)
        gray.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        gray.alpha = 0.0
        return gray
    }()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
