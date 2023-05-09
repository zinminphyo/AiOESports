//
//  VerifyPhoneModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/05/2023.
//

import Foundation
import UIKit


enum VerifyPhoneModule {
    static func createModule() -> VerifyPhone? {
        let st = UIStoryboard(name: "VerifyPhone", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: VerifyPhone.self)) as? VerifyPhone else { return nil }
        return vc
    }
}
