//
//  PlayerOverviewRouter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation
import UIKit

class PlayerOverviewRouter: PlayerOverviewRouting {
    func routeToFacebookPage(id: String) {
        guard let url = URL(string: id) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func routeToYoutube(id: String) {
        guard let url = URL(string: id) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func routeToFacebookProfile(url: String) {
        guard let url = URL(string: url) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
