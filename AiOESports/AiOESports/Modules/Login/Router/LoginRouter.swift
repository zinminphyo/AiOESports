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
        scene.window?.rootViewController = vc
    }
    
}
