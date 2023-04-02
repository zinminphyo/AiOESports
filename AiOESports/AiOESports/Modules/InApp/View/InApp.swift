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
        
        configureHierarchy()
        
        self.tabBar.tintColor = Colors.Button.primaryColor
        self.tabBar.backgroundColor = Colors.Theme.mainColor
        self.tabBar.unselectedItemTintColor = UIColor.gray
    }
    
    private func configureHierarchy() {
        
        if let homeVC = HomeModule.createModule(),
           let rankVC = RankModule.createModule() {
            
            homeVC.tabBarItem.title = "Home"
            homeVC.tabBarItem.image = Images.InAppImages.homelogo
            
            rankVC.tabBarItem.title = "Rank"
            rankVC.tabBarItem.image = Images.InAppImages.ranklogo
            
            
            self.viewControllers = [
                homeVC,
                rankVC
            ]
        }
        
    }
    

}
