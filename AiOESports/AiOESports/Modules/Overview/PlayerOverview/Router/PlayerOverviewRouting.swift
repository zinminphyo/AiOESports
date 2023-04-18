//
//  PlayerOverviewRouting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation


protocol PlayerOverviewRouting {
    func routeToFacebookPage(id: String)
    func routeToYoutube(id: String)
    func routeToFacebookProfile(url: String)
}
