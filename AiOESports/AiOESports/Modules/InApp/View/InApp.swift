//
//  InApp.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/04/2023.
//

import UIKit

class InApp: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        if let homeVC = HomeModule.createModule() {
            homeVC.tabBarItem.image = Images.InAppImages.homelogo
            homeVC.tabBarItem.title = "Home"
            self.viewControllers = [ homeVC ]
        }
        self.tabBar.tintColor = Colors.Button.primaryColor
        self.tabBar.backgroundColor = Colors.Theme.mainColor
        self.tabBar.unselectedItemTintColor = Colors.Button.secondaryColor
    }
    

}
