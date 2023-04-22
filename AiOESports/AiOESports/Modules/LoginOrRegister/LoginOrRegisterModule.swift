//
//  LoginOrRegisterModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 20/04/2023.
//

import Foundation
import UIKit


enum LoginOrRegisterModule {
    static func createModule() -> LoginOrRegister? {
        let st = UIStoryboard(name: "LoginOrRegister", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: LoginOrRegister.self)) as? LoginOrRegister else { return nil }
        return vc
    }
}
