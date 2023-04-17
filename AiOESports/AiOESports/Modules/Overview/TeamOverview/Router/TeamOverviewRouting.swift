//
//  TeamOverviewRouting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/04/2023.
//

import Foundation
import UIKit


protocol TeamOverviewRouting {
    var viewController: UIViewController? { get set }
    func routeToFacebookPage(id: String)
}
