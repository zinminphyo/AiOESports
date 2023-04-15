//
//  DetailsPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/04/2023.
//

import Foundation
import UIKit

class DetailsPresenter: DetailsPresenting {
    
    init(category: RankCategory, id: Int) {
        self.category = category
        self.id = id
    }
    
    var viewDelegate: DetailsViewDelegate?
    
    private var category: RankCategory = .team
    private var id: Int = 0
    
    private var teamDetails: TeamDetails? = nil
    private var playerDetails: PlayerDetails? = nil
    private var casterDetails: PlayerDetails? = nil
    private var creatorDetails: PlayerDetails? = nil
    
    func fetchDetails() {
        switch category {
        case .team:
            let router = ApiRouter.teamDetails(id)
            NetworkService.shared.request(router: router) { (result: Result<TeamDetails, NetworkError>) in
                switch result {
                case .success(let success):
                    self.teamDetails = success
                    self.viewDelegate?.renderDetails(details: success)
                case .failure(let failure):
                    print("Failure is \(failure)")
                }
            }
        case .player:
            let router = ApiRouter.playerDetails(id)
            NetworkService.shared.request(router: router) { (result: Result<PlayerDetails, NetworkError>) in
                switch result {
                case .success(let success):
                    self.playerDetails = success
                    self.viewDelegate?.renderPlayerDetails(details: success)
                case .failure(let failure):
                    print("Player detials error is \(failure.localizedDescription)")
                }
            }
        case .caster:
            let router = ApiRouter.casterDetails(id)
            NetworkService.shared.request(router: router) { (result: Result<PlayerDetails,NetworkError>) in
                switch result {
                case .success(let success):
                    self.casterDetails = success
                    self.viewDelegate?.renderCasterDetails(details: success)
                case .failure(let failure):
                    print("Failure is \(failure)")
                }
            }
        case .creator:
            let router = ApiRouter.creatorDetails(id)
            NetworkService.shared.request(router: router) { (result: Result<PlayerDetails, NetworkError>) in
                switch result {
                case .success(let success):
                    self.creatorDetails = success
                    self.viewDelegate?.renderCreatorDetails(details: success)
                case .failure(let failure):
                    print("Failure is \(failure)")
                }
            }
        }
        
    }
    
    
    func getNumberOfContentCount() -> Int {
        switch category {
        case .team:
            return TeamDetailsContent.allCases.count
        case .player:
            return PlayerDetailsContent.allCases.count
        case .caster:
            return CasterDetailsContent.allCases.count
        case .creator:
            return CreatorDetailContent.allCases.count
        }
    }
    
    func getContentTitle(for index: Int) -> String {
        switch category {
        case .team:
            return TeamDetailsContent.allCases[index].title
        case .player:
            return PlayerDetailsContent.allCases[index].title
        case .caster:
            return CasterDetailsContent.allCases[index].title
        case .creator:
            return CreatorDetailContent.allCases[index].title
        }
    }
    
    
    func getContentView(for category: RankCategory, at index: Int) -> UIViewController {
        switch category {
        case .team:
            return getContentForGameCategory(for: index)
        case .player:
            return getContentForPlayerCategory(for: index)
        case .caster:
            return  getContentForCasterCategory(for: index)
        case .creator:
            return getContentForCreatorCategory(for: index)
        }
    }
    
    private func getContentForGameCategory(for index: Int) -> UIViewController {
        guard let teamDetails = teamDetails else { return UIViewController() }
        switch index {
        case 0:
            guard let vc = TeamOverviewModule.createModule(teamDetails: teamDetails.detail, social: teamDetails.social) else { return UIViewController() }
            return vc
        case 1:
            guard let vc = AchivementModule.createModule(achivementLists: teamDetails.achivemets) else { return UIViewController() }
            return vc
        case 2:
            guard let vc = SquadModule.createModule(squad: teamDetails.squad) else { return UIViewController() }
            return vc
        case 3:
            guard let vc = FormerPlayersModule.createModule(formerPlayers: teamDetails.formerPlayers) else { return UIViewController() }
            return vc
        case 4:
            guard let vc = SponsorModule.createModule(sponsorLists: teamDetails.sponsors) else { return UIViewController() }
            return vc
        default:
            return UIViewController()
        }
    }
    
    private func getContentForPlayerCategory(for index: Int) -> UIViewController {
        guard let playerDetails = playerDetails else { return UIViewController() }
        switch index {
        case 0:
            guard let vc = PlayerOverviewModule.createModule(playerDetails: playerDetails.details, social: playerDetails.social, signatureLists: playerDetails.signature) else { return UIViewController() }
            return vc
        case 1:
            guard let vc = SquadModule.createModule(playerAchivement: playerDetails.playerAchivement) else { return UIViewController() }
            return vc
        case 2:
            guard let vc = CareerModule.createModule(careerLists: playerDetails.career) else { return UIViewController() }
            return vc
        default:
            return UIViewController()
        }
    }
    
    private func getContentForCasterCategory(for index: Int) -> UIViewController {
        guard let casterDetails = casterDetails else { return UIViewController() }
        switch index {
        case 0:
            guard let vc = CasterOverviewModule.createModule(details: casterDetails) else { return UIViewController() }
            return vc
        default:
            guard let vc = SquadModule.createModule(playerAchivement: casterDetails.playerAchivement) else { return UIViewController() }
            return vc
        }
    }
    
    private func getContentForCreatorCategory(for index: Int) -> UIViewController {
        guard let creatorDetails = creatorDetails else { return UIViewController() }
        switch index {
        case 0:
            guard let vc = CreatorOverviewModule.createModuel(creatorDetails: creatorDetails) else { return UIViewController() }
            return vc
        default:
            return UIViewController()
        }
    }
}
