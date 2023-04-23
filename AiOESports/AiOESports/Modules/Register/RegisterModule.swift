//
//  RegisterModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 23/04/2023.
//

import Foundation
import UIKit

enum RegisterModule {
    static func createModule() -> Register? {
        let st = UIStoryboard(name: "Register", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Register.self)) as? Register else { return nil }
        return vc
    }
}
