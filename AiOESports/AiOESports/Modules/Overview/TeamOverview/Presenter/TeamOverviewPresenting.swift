//
//  TeamOverviewPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


protocol TeamOverviewPresenting {
    var viewDelegate: TeamOverviewViewDelegate? { get set }
    var routing: TeamOverviewRouting? { get set }
    func viewDidLoad()
    func didTapSocial(social: SocialModel)
}
