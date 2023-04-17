//
//  PlayerOverviewRouter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation
import UIKit

class PlayerOverviewRouter: PlayerOverviewRouting {
    func routeToFacebook(id: String) {
        guard let url = URL(string: "fb://profile?id=\(id)") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
