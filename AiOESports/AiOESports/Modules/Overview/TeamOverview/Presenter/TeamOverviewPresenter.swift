//
//  TeamOverviewPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


class TeamOverviewPresenter: TeamOverviewPresenting {
    
    var viewDelegate: TeamOverviewViewDelegate?
    var routing: TeamOverviewRouting?
    
    private var teamDetails: TeamDetailsModel? = nil
    private var socialLists: [SocialModel] = []
    
    func viewDidLoad() {
        guard let detail = teamDetails else { return }
        self.viewDelegate?.updateUI(details: detail, social: socialLists)
    }
    
    func set(details: TeamDetailsModel, social: [SocialModel]) {
        self.teamDetails = details
        self.socialLists = social
    }
    
    func didTapSocial(social: SocialModel) {
        print("Social is \(social.platform)")
        switch social.platform {
        case "facebook_page":
            self.routing?.routeToFacebookPage(id: social.link)
        default:
            break
        }
    }
    
}
