//
//  LoginRouting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 24/04/2023.
//

import Foundation
import UIKit

protocol LoginRouting {
    var viewController: Login? { get set }
    func routeToRegisterModule()
}
