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
        let presenter = LoginPresenter()
        presenter.viewDelegate = vc
        let router = LoginRouter()
        router.viewController = vc
        presenter.router = router
        vc.presenter = presenter
        return vc
    }
}
