//
//  MatchModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import Foundation
import UIKit



enum MatchModule {
    static func createModule() -> Match? {
        let st = UIStoryboard(name: "Match", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Match.self)) as? Match else {
            return nil
        }
        vc.tabBarItem.title = "MATCH"
        vc.tabBarItem.setTitleTextAttributes([.foregroundColor : Colors.TabItem.match], for: .normal)
        vc.tabBarItem.image = Images.InAppImages.match_unselected
        vc.tabBarItem.selectedImage = Images.InAppImages.match_selected
        return vc
    }
}
