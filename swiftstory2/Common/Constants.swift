//
// Created by gyakkun on 2020/7/19.
// Copyright (c) 2020 gyakkun. All rights reserved.
//

import UIKit


let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

let KeyWindow = UIApplication.shared.keyWindow

let kIsIphone = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

let kIsIphoneX = Bool(kScreenW>=375.0 && kScreenH >= 812.0 && kIsIphone)

let kIsIpad = Bool( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad )

let kNavigationBarH = CGFloat(kIsIphoneX ? 88 : 64)

let kStatusBarH = CGFloat( kIsIphone ? 44:20 )

let kTabBarH = CGFloat( kIsIphone ? (49+34):49)

func RGBColor(r:CGFloat, g: CGFloat, b:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0 , green : g/255.0 , blue: b/255.0 , alpha:1)
}


func customFont(font: CGFloat) ->UIFont{
    // 刘海屏
    guard kScreenH <= 736 else {
        return UIFont.systemFont(ofSize: font)
    }

    // 5.5 iPhone Plus
    guard  kScreenH == 736 else {
        return UIFont.systemFont(ofSize: font - 2)
    }

    // 4.7 iPhone 6 7 8
    guard kScreenH >= 736 else {
        return UIFont.systemFont(ofSize: font - 4)
    }

    return UIFont.systemFont(ofSize: font)

}