//
//  FourthMineViewController.swift
//  swiftstory2
//
//  Created by gyakkun on 2020/7/21.
//  Copyright © 2020 gyakkun. All rights reserved.
//

import UIKit

class FourthMineViewController: UIViewController {

    var style : UIStatusBarStyle = .default
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.style
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(grayView)
        view.addSubview(loginView)
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
        createHidden(value: 1)
        self.style = .lightContent
        setNeedsStatusBarAppearanceUpdate()

        UIView.animate(withDuration: 0.5) { () -> Void in
            self.loginView.frame = CGRect(x: 0, y: 0.5*kScreenH, width: kScreenW, height: kScreenH)

            self.grayView.alpha = 1.0

        }

        self.perform(#selector(downMove), with: nil, afterDelay: 0.5)

    }

    private lazy var grayView : UIView = {
        let gray = UIView.init(frame: self.view.bounds)
        gray.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        gray.alpha = 0.0
        return gray
    }()

    private func createHidden(value:NSInteger){
        if value == 1 {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        } else {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.perform(#selector(hidTabBar), with: nil, afterDelay: 0.25)
        }
    }

    @objc func hidTabBar(){
        self.tabBarController?.tabBar.isHidden = true
    }

    @objc func downMove(){
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.loginView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH)

            self.grayView.alpha = 1.0

        }
    }

    private lazy var loginView : UIView = {
        let loginView = UIView.init(frame: CGRect(x: 0, y: kScreenH, width: kScreenW, height: kScreenH))
        loginView.backgroundColor = UIColor.white
        loginView.layer.cornerRadius = 10
        loginView.layer.masksToBounds = true

        return loginView
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
