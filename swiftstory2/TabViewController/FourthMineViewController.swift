//
//  FourthMineViewController.swift
//  swiftstory2
//
//  Created by gyakkun on 2020/7/21.
//  Copyright © 2020 gyakkun. All rights reserved.
//

import UIKit

class FourthMineViewController: UIViewController {

    var style: UIStatusBarStyle = .default
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.style
    }

    var loginViewOriginY: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        loginViewOriginY = kStatusBarH

        view.addSubview(button)
        view.addSubview(grayView)
        view.addSubview(loginView)
        print(kScreenW, kScreenH)
        // Do any additional setup after loading the view.
    }

    private lazy var button: UIButton = {

        let btn = UIButton.init(type: .roundedRect)
        btn.frame = CGRect(x: 10, y: 300, width: kScreenW - 20, height: 100)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        return btn
    }()

    @objc private func btnClick() {
        print("[btnClick] btn clicked.")
        createHidden(value: 1)
        self.style = .lightContent
        setNeedsStatusBarAppearanceUpdate()

        UIView.animate(withDuration: 0.5) { () -> Void in
            self.loginView.frame = CGRect(x: 0, y: 0.5 * kStatusBarH, width: kScreenW, height: kScreenH)

            self.grayView.alpha = 1.0

        }

        self.perform(#selector(downMove), with: nil, afterDelay: 0.5)

    }

    private lazy var grayView: UIView = {
        let gray = UIView.init(frame: self.view.bounds)
        gray.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        gray.alpha = 0.0
        return gray
    }()

    private func createHidden(value: NSInteger) {
        if value == 1 {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.tabBarController?.tabBar.isHidden = true
        } else {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            self.perform(#selector(hidTabBar), with: nil, afterDelay: 0.25)

        }
    }

    @objc func hidTabBar() {
        self.tabBarController?.tabBar.isHidden = false
    }

    @objc func downMove() {
        UIView.animate(withDuration: 0.2) { () -> Void in
            self.loginView.frame = CGRect(x: 0, y: kStatusBarH, width: kScreenW, height: kScreenH)

            self.grayView.alpha = 1.0

        }
    }

    @objc func pan(panGesture: UIPanGestureRecognizer) {

        if panGesture.state == .began {
            print("[pan] panning")
        } else if panGesture.state == .changed {
            let y = panGesture.translation(in: self.view).y

            if y <= kStatusBarH {
                self.loginView.frame = CGRect(x: 0, y: kStatusBarH,
                        width: kScreenW, height: kScreenH)

            } else {
                self.loginView.frame = CGRect(x: 0, y: loginViewOriginY + y,
                        width: kScreenW, height: kScreenH)
            }

            var scrollAlpha = self.loginView.frame.origin.y / kScreenH / 2

            if scrollAlpha > 0.5 {
                scrollAlpha = 0.5
            }
            self.grayView.alpha = 1 - scrollAlpha

        } else if panGesture.state == .ended {
            if self.loginView.frame.origin.y <= kScreenH / 2 {
                UIView.animate(withDuration: 0.2) { () -> Void in
                    self.loginView.frame = CGRect(x: 0, y: self.loginViewOriginY,
                            width: kScreenW, height: kScreenH)
                    self.grayView.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.25) { () -> Void in
                    self.loginView.frame = CGRect(x: 0, y: kScreenH,
                            width: kScreenW, height: kScreenH)
                    self.grayView.alpha = 0.0
                }
            }
            if self.grayView.alpha >= 0.5 {
                self.style = .lightContent
                setNeedsStatusBarAppearanceUpdate()
            } else {
                self.style = .default
                setNeedsStatusBarAppearanceUpdate()
            }

        }
    }

    private lazy var loginView: UIView = {
        let loginView = LoginView.init(frame: CGRect(x: 0, y: kScreenH, width: kScreenW, height: kScreenH))
        loginView.backgroundColor = UIColor.white
        loginView.layer.cornerRadius = 10
        loginView.layer.masksToBounds = true

        let panView = UIPanGestureRecognizer.init(target: self,
                action: #selector(pan(panGesture:)))

        loginView.addGestureRecognizer(panView)

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
