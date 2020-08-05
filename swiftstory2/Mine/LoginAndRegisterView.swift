//
//  LoginAndRegisterView.swift
//  swiftstory2
//
//  Created by gyakkun on 2020/8/4.
//  Copyright © 2020 gyakkun. All rights reserved.
//

import UIKit

class LoginAndRegisterView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


// Load Xib
extension LoginAndRegisterView {
    class func loadFromNib() ->LoginAndRegisterView{
        return Bundle.main.loadNibNamed("LoginAndRegisterView", owner: nil, options: nil)?[0] as! LoginAndRegisterView
    }
}
