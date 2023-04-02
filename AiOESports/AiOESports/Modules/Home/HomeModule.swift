//
//  HomeModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/04/2023.
//

import Foundation
import UIKit


enum HomeModule {
    static func createModule() -> Home? {
        let st = UIStoryboard(name: "Home", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Home.self)) as? Home else {
            return nil
        }
        return vc
    }
}
