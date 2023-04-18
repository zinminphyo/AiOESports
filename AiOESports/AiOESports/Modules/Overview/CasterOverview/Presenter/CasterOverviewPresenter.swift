//
//  CasterOverviewPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation


class CasterOverviewPresenter: CasterOverviewPresenting {
    
    var viewDelegate: CasterOverviewViewDelegate?
    
    var router: CasterOverviewRouting?
    
    private var details: PlayerDetails? = nil
    
    init(casterDetails: PlayerDetails) {
        self.details = casterDetails
    }
    
    func viewDidLoad() {
        guard let details = details else { return }
        self.viewDelegate?.renderUI(details: details)
    }
    
    func didTapSocial(social: SocialModel) {
        switch social.platform {
        case "facebook":
            router?.routeToFacebookProfile(url: social.link)
        case "facebook_page":
            router?.routeToFacebookPage(url: social.link)
        case "youtube":
            router?.routeToYouTube(url: social.link)
        case "instagram":
            router?.routeToInstagram(url: social.link)
        case "twitch":
            router?.routeToTwitch(url: social.link)
        default:
            break
        }
    }
}
