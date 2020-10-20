//
//  LoginAndRegisterView.swift
//  swiftstory2
//
//  Created by gyakkun on 2020/8/4.
//  Copyright © 2020 gyakkun. All rights reserved.
//

import UIKit

class LoginAndRegisterView: UIView {

    @IBOutlet weak var topTitle: UILabel!

    @IBOutlet weak var phoneView: UIView!

    @IBOutlet weak var phoneTextField: UITextField!

    @IBOutlet weak var smsTextCodeView: UIView!

    @IBOutlet weak var smsTextField: UITextField!

    @IBOutlet weak var registerButton: UIButton!

    @IBOutlet weak var loginTypeView: UIView!

    @IBOutlet weak var agreeToggle: UIButton!
    
    @IBOutlet weak var viewAgreementView: UIView!
    
    
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
