//
//  MenuModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/04/2023.
//

import Foundation
import UIKit


enum MenuModule {
    static func createModule() -> Menu? {
        let st = UIStoryboard(name: "Menu", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Menu.self)) as? Menu else { return nil }
        return vc
    }
}
