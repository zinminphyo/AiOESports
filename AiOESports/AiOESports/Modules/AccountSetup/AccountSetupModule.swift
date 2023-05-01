//
//  AccountSetupModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 01/05/2023.
//

import Foundation
import UIKit


enum AccountSetupModule {
    static func createModule() -> AccountSetup? {
        let st = UIStoryboard(name: "AccountSetup", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: AccountSetup.self)) as? AccountSetup else {return nil}
        return vc
    }
}
