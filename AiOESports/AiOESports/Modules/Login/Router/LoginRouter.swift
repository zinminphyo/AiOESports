//
//  LoginRouter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 24/04/2023.
//

import Foundation
import UIKit

class LoginRouter: LoginRouting {
    
    var viewController: Login?
    
    func routeToRegisterModule() {
        guard let vc = RegisterModule.createModule() else { return }
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func routeToInAppModule() {
        guard let vc = InAppModule.createModule(), let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        scene.window?.rootViewController = nav
    }
    
    
    func routeToForgetPasswordModule() {
        /*
        guard let vc = ForgotPasswordModule.createModule() else { return }
        viewController?.navigationController?.pushViewController(vc, animated: true)
         */
        let vc = ForgetPasswordWithoutAuth()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
