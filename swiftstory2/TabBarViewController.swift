//
//  TabBarViewController.swift
//  swiftstory2
//
//  Created by gyakkun on 2020/7/20.
//  Copyright © 2020 gyakkun. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addController()
        // Do any additional setup after loading the view.
    }

    private func addController(){
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

        // unselected image
        childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)

        // selected image
        childVC.tabBarItem.selectedImage = UIImage(named: selectImg)?.withRenderingMode(.alwaysOriginal)

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
