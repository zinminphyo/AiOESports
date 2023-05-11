//
//  WelcomeModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/05/2023.
//

import Foundation
import UIKit


enum WelcomeModule {
    static func createModule() -> Welcome? {
        let st = UIStoryboard(name: "Welcome", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Welcome.self)) as? Welcome else { return nil }
        return vc
    }
}
