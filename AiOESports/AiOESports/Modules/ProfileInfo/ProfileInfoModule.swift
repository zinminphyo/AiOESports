//
//  ProfileInfoModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 01/05/2023.
//

import Foundation
import UIKit



enum ProfileInfoModule {
    static func createModule() -> ProfileInfo? {
        let st = UIStoryboard(name: "ProfileInfo", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: ProfileInfo.self)) as? ProfileInfo else { return nil }
        return vc
    }
}
