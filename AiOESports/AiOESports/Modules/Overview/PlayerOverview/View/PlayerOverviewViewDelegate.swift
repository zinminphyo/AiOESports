//
//  PlayerOverviewViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import Foundation



protocol PlayerOverviewViewDelegate {
    var presenter: PlayerOverviewPresenting? { get set }
    func renderDetails(details: PlayerDetailsModel, social: [SocialModel])
}
