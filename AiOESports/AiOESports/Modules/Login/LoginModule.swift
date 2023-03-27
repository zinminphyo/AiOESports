//
//  LoginModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/03/2023.
//

import Foundation
import UIKit

enum LoginModule {
    static func createModule() -> Login? {
        let st = UIStoryboard(name: "Login", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Login.self)) as? Login else {
            return nil
        }
        return vc
    }
}
