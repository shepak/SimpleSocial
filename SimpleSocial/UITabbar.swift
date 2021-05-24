//
//  UITabbar.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 05.02.2021.
//

import UIKit

class UITabbar: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.title!)
    }
    

    @IBOutlet weak var Maintabbar: UITabBar!
    
}
