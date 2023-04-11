//
//  TeamoverviewViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


protocol TeamOverviewViewDelegate {
    var presenter: TeamOverviewPresenting? { get set }
    func updateUI(details: TeamDetailsModel, social: [SocialModel])
}
