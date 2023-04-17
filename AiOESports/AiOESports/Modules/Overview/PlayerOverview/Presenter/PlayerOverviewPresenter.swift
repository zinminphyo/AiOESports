//
//  PlayerOverviewPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import Foundation


class PlayerOverviewPresenter: PlayerOverviewPresenting {
    
    private var details: PlayerDetailsModel? = nil
    private var social: [SocialModel] = []
    private var signatureLists: [SignatureModel] = []
    
    init(details: PlayerDetailsModel, social: [SocialModel], signatureLists: [SignatureModel]) {
        self.details = details
        self.social = social
        self.signatureLists = signatureLists
    }
    
    var viewDelegate: PlayerOverviewViewDelegate?
    var router: PlayerOverviewRouting?
    
    func viewDidLoad() {
        guard let details = details else { return }
        self.viewDelegate?.renderDetails(details: details, social: social)
    }
    
    func getTitleForCell(at index: Int) -> String {
        switch index {
        case 0:
            return "Team"
        case 1:
            return "Full Name"
        case 2:
            return "Birthday"
        case 3:
            return "Location"
        case 4:
            return "Role"
        default:
            return ""
        }
    }
    
    func getValueForCell(at index: Int) -> String {
        guard let details = details else { return "" }
        switch index {
        case 0:
            return details.teamName
        case 1:
            return details.fullName
        case 2:
            return details.birthday
        case 3:
            return details.city
        case 4:
            return details.role
        default:
            return ""
        }
    }
    
    func getImageURLForCell(at index: Int) -> String? {
        guard let details = details else { return nil }
        switch index {
        case 0:
            return details.teamImageFullPath
        case 1, 2:
            return nil
        case 3:
            return details.locationImageFullPath
        default:
            return nil
        }
    }
    
    func getSignatureLists() -> [SignatureModel] {
        return self.signatureLists
    }
    
    
    func didTapSocial(social: SocialModel) {
        print("Platform is \(social.platform)")
        switch social.platform {
        case "facebook_page":
            router?.routeToFacebook(id: social.link)
        default:
            break
        }
    }
    
}
