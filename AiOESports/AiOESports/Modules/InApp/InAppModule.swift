//
//  InAppModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/04/2023.
//

import Foundation
import UIKit


enum InAppModule {
    static func createModule() -> InApp? {
        let st = UIStoryboard(name: "InApp", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: InApp.self)) as? InApp else {
            return nil
        }
        return vc
    }
}
