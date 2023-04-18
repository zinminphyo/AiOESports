//
//  HomeContainerModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/04/2023.
//

import Foundation
import UIKit


enum HomeContainerModule {
    static func createModule() -> HomeContainer? {
        let st = UIStoryboard(name: "HomeContainer", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: HomeContainer.self)) as? HomeContainer else { return nil }
        vc.tabBarItem.image = Images.InAppImages.home_unselected
        vc.tabBarItem.title = "HOME"
        vc.tabBarItem.setTitleTextAttributes([.foregroundColor : Colors.TabItem.home], for: .normal)
        vc.tabBarItem.selectedImage = Images.InAppImages.home_selected
        return vc
    }
}
