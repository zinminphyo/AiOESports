//
//  ShopModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import Foundation
import UIKit


enum ShopModule {
    static func createModule() -> Shop? {
        let st = UIStoryboard(name: "Shop", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Shop.self)) as? Shop else {
            return nil
        }
        vc.tabBarItem.title = "SHOP"
        vc.tabBarItem.setTitleTextAttributes([.foregroundColor : Colors.TabItem.shop], for: .normal)
        vc.tabBarItem.image = Images.InAppImages.shop_unselected
        vc.tabBarItem.selectedImage = Images.InAppImages.shop_selected
        return vc
    }
}
