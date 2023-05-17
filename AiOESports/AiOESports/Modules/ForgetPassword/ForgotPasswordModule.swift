//
//  ForgotPasswordModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/05/2023.
//

import Foundation
import UIKit


enum ForgotPasswordModule {
    static func createModule() -> ForgotPassword? {
        let st = UIStoryboard(name: "ForgotPassword", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: ForgotPassword.self)) as? ForgotPassword else { return nil }
        return vc
    }
}
