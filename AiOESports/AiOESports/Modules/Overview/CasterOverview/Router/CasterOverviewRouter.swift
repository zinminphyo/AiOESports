//
//  CasterOverviewRouter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/04/2023.
//

import Foundation
import UIKit

class CasterOverviewRouter: CasterOverviewRouting {
    
    func routeToFacebookPage(url: String) {
        guard let url = URL(string: url) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.open(URL(string: "fb://profile/\(url)")!)
        }
    }
    
    func routeToFacebookProfile(url: String) {
        guard let url = URL(string: url) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.open(URL(string: "fb://profile/\(url)")!)
        }
    
    }
    
    func routeToYouTube(url: String) {
        guard let url = URL(string: url) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.open(URL(string: "youtube://\(url)")!)
        }
    }
 
    func routeToInstagram(url: String) {
        guard let url = URL(string: url) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.open(URL(string: "instagram://user?username=\(url)")!)
        }
    }
    
    func routeToTwitch(url: String) {
        guard let url = URL(string: url) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    
}
