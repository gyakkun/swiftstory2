//
//  LoginAndRegisterView.swift
//  swiftstory2
//
//  Created by gyakkun on 2020/8/4.
//  Copyright © 2020 gyakkun. All rights reserved.
//

import UIKit

class LoginAndRegisterView: UIView {
    // 顶部标题
    @IBOutlet weak var topTitle: UILabel!
    // 手机号输入view
    @IBOutlet weak var phoneView: UIView!
    // 手机号输入文本框
    @IBOutlet weak var phoneTextField: UITextField!
    // 验证码输入view
    @IBOutlet weak var smsTextCodeView: UIView!
    // 验证码输入文本框
    @IBOutlet weak var smsTextField: UITextField!
    // 注册登录按钮
    @IBOutlet weak var registerButton: UIButton!
    // 注册类型选择view
    @IBOutlet weak var loginTypeView: UIView!
    // 同意复选框
    @IBOutlet weak var agreeToggle: UIButton!
    // 查看协议view
    @IBOutlet weak var viewAgreementView: UIView!
    // 已读协议view
    @IBOutlet weak var hasViewedAgreementView: UIView!
    // 发送验证码按钮
    @IBOutlet weak var sendSmsButton: UIButton!
    // 手机号错误提示
    @IBOutlet weak var wrongPhoneNumberLabel: UILabel!
    // 验证码错误提示
    @IBOutlet weak var wrongSmsCodeLabel: UILabel!
    // 密码登录按钮
    @IBOutlet weak var passwordLoginButton: UIButton!
    // 手机登录按钮
    @IBOutlet weak var phoneLoginButton: UIButton!
    
    override func layoutSubviews() {
        setUI()

    }
}


// Load Xib
extension LoginAndRegisterView {
    class func loadFromNib() -> LoginAndRegisterView {
        return Bundle.main.loadNibNamed("LoginAndRegisterView", owner: nil, options: nil)?[0] as! LoginAndRegisterView
    }
}

extension LoginAndRegisterView {
    private func setUI() {
        self.viewAgreementView.isHidden = true
        self.loginTypeView.isHidden = true

        self.phoneView.layer.borderWidth = 1
        self.phoneView.layer.borderColor = UIColor.gray.cgColor
        self.phoneView.layer.cornerRadius = customLayer(num: 22.5)
        self.phoneView.layer.masksToBounds = true

        self.smsTextCodeView.layer.borderWidth = 1
        self.smsTextCodeView.layer.borderColor = UIColor.gray.cgColor
        self.smsTextCodeView.layer.cornerRadius = customLayer(num: 22.5)
        self.smsTextCodeView.layer.masksToBounds = true

        self.registerButton.layer.cornerRadius = customLayer(num: 22.5)
        self.registerButton.layer.masksToBounds = true

    }
}
