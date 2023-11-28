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
        

        self.tabBar.backgroundColor = Colors.Theme.mainColor
        self.tabBar.unselectedItemTintColor = UIColor.gray
    }
    
    private func configureHierarchy() {
        
        if let homeVC = HomeModule.createModule(),
           let rankVC = RankModule.createModule(),
           let matchVC = MatchModule.createModule(),
           let tourVC = TourModule.createModule(),
           let shopVC = ShopModule.createModule() {
            
            self.viewControllers = [
                homeVC,
                rankVC,
                matchVC,
                tourVC,
                shopVC
            ]
        }
        
    }
    

}
