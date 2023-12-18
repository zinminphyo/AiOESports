//
//  TourModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import Foundation
import UIKit


enum TourModule {
    static func createModule() -> Tour? {
        let st = UIStoryboard(name: "Tour", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Tour.self)) as? Tour else {
            return nil
        }
        vc.tabBarItem.title = "TOUR"
        vc.tabBarItem.setTitleTextAttributes([.foregroundColor:Colors.TabItem.tour], for: .normal)
        vc.tabBarItem.image = Images.InAppImages.tour_unselected
        vc.tabBarItem.selectedImage = Images.InAppImages.tour_selected
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        return vc
    }
}
