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
        vc.tabBarItem.image = Images.InAppImages.tourlogo
        return vc
    }
}
