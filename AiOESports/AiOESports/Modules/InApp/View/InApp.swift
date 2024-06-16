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
//        self.tabBar.contentMode = .scaleAspectFit
    }
    
    private func configureHierarchy() {
        
        if let homeVC = HomeModule.createModule(),
           let rankVC = RankModule.createModule(),
           let matchVC = MatchModule.createModule(),
           let tourVC = TourModule.createModule(),
           let shopVC = ShopModule.createModule() {
            
            self.viewControllers = [
                homeVC,
                addRankingController(),
                matchVC,
                tourVC,
                shopVC
            ]
        }
         
    }

    private func addRankingController() -> UIViewController {
        let vc = RankingController()
        vc.tabBarItem.image = Images.InAppImages.rank_unselected
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        vc.tabBarItem.selectedImage = Images.InAppImages.rank_selected
        vc.tabBarItem.title = "RANK"
        vc.tabBarItem.setTitleTextAttributes([.foregroundColor:Colors.TabItem.rank], for: .normal)
        return vc
    }


}
