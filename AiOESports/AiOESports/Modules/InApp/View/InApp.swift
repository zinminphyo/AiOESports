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
            homeVC.tabBarItem.title = "Home"
            homeVC.tabBarItem.image = Images.countryImage
            self.viewControllers = [ homeVC ]
        }
    }
    

}
