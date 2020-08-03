//
//  TabBarViewController.swift
//  swiftstory2
//
//  Created by gyakkun on 2020/7/20.
//  Copyright © 2020 gyakkun. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var indexFlag = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        addControllers()
        // Do any additional setup after loading the view.
    }

    private func addControllers() {
        addChildController(ViewController(), title: "首页",
                image: "TabBarIcon.Home.unselected", selectImg: "TabBarIcon.Home.selected")
        addChildController(SecondVideoViewController(), title: "西瓜视频",
                image: "TabBarIcon.Video.unselected", selectImg: "TabBarIcon.Video.selected")
        addChildController(ThirdMicroVideoViewController(), title: "首页",
                image: "TabBarIcon.MicroVideo.unselected", selectImg: "TabBarIcon.MicroVideo.selected")
        addChildController(FourthMineViewController(), title: "首页",
                image: "TabBarIcon.Mine.unselected", selectImg: "TabBarIcon.Mine.selected")
    }

    private func addChildController(_ childVC: UIViewController, title: String, image: String,
                                    selectImg: String) {

        // item title text
        childVC.tabBarItem.title = title

        let size = CGSize(width: 40, height: 40)

        UIGraphicsBeginImageContext(size)

        var tmpUnselectedImage = UIImage(named: image)?
                .draw(in: CGRect(x: 0, y: 0, width: size.height, height: size.width))

        var realUnselectedImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        // unselected image
        childVC.tabBarItem.image = realUnselectedImage?.withRenderingMode(.alwaysOriginal)

        UIGraphicsBeginImageContext(size)

        var tmpSelectedImage = UIImage(named: selectImg)?
                .draw(in: CGRect(x: 0, y: 0, width: size.height, height: size.width))

        var realSelectedImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        // selected image
        childVC.tabBarItem.selectedImage = realSelectedImage?.withRenderingMode(.alwaysOriginal)

        // selected text color
        UITabBarItem.appearance().setTitleTextAttributes(
                [
                    NSAttributedString.Key.foregroundColor: RGBColor(r: 245, g: 90, b: 93)
                ],
                for: .selected
        )

        let nav = UINavigationController()

        nav.addChild(childVC)

        addChild(nav)

    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            if indexFlag != index {
                animationWithIndex(index: index)
            }
        }
    }

    private func animationWithIndex(index: Int) {
        var viewArr = [UIView]()
        for tabButton in tabBar.subviews {
            if tabButton.isKind(of: NSClassFromString("UITabBarButton")!) {
                viewArr.append(tabButton)
            }
        }

        let pulse = CABasicAnimation(keyPath: "transform.scale")

        pulse.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)

        pulse.duration = 0.1

        pulse.repeatCount = 1

        pulse.autoreverses = true

        pulse.fromValue = NSNumber(value: 0.7)
        pulse.toValue = NSNumber(value: 1.1)

        viewArr[index].layer.add(pulse, forKey: nil)


    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
