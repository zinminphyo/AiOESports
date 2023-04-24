//
//  LoginRouter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 24/04/2023.
//

import Foundation


class LoginRouter: LoginRouting {
    
    var viewController: Login?
    
    func routeToRegisterModule() {
        guard let vc = RegisterModule.createModule() else { return }
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
