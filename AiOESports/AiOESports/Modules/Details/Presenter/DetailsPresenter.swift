//
//  DetailsPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/04/2023.
//

import Foundation
import UIKit
import Combine

class DetailsPresenter: DetailsPresenting {
    
    private let detailsFetchingService: GetDetailsService!
    private let followService: FollowService
    
    @Published
    var teamDetail: TeamDetails? = nil
    
    @Published
    var playerDetail: PlayerDetails? = nil
    
    @Published
    var casterDetail: CasterDetails? = nil
    
    @Published
    var creatorDetail: CasterDetails? = nil
    
    @Published
    var isFollowing: Bool = false
    
    @Published
    var isVoting: Bool = false
    
    var forceFetchDetails = PassthroughSubject<Void, Never>()
    
    @Published
    var isFetching: Bool = false
    
    init(category: RankCategory, id: Int) {
        self.category = category
        self.id = id
        detailsFetchingService = GetDetailsService()
        followService = FollowService(id: String(id))
    }
    
    @Published
    var isLoading: Bool = false
    
    var viewDelegate: DetailsViewDelegate?
    
    private(set) var category: RankCategory = .team
    private(set) var id: Int = 0
    
    private(set) var teamDetails: TeamDetails? = nil
    private(set) var playerDetails: PlayerDetails? = nil
    private(set) var casterDetails: CasterDetails? = nil
    private(set) var creatorDetails: CasterDetails? = nil
    
    func fetchDetails() {
        isFetching = true; defer { isFetching = false }
        switch category {
        case .team:
            fetchTeamDetails()
        case .player:
            fetchPlayerDetails()
        case .caster:
            fetchCasterDetails()
        case .creator:
            fetchCreatorDetails()
        }
        
    }
    
    func follow() {
        switch category {
        case .team:
            isFollowing ? unfollowTeam() : followTeam()
        default:
            isFollowing ? unfollowTalent() : followTalent()
        }
        
    }
    
    
    private func followTeam() {
        isLoading = true
        Task {
            do {
                let response = try await followService.followTeam()
                guard response.statusCode == 200 else { return }
                fetchDetails()
            } catch {
                print("Error in follow team is \(error.localizedDescription)")
            }
            isLoading = false
        }
    }
    
    private func unfollowTeam() {
        isLoading = true
        Task {
            do {
                let response = try await followService.unFollowTeam()
                guard response.statusCode == 200 else { return }
                fetchDetails()
            } catch {
                print("Error in unfollow team is \(error.localizedDescription)")
            }
            isLoading = false
        }
    }
    
    private func followTalent() {
        isLoading = true
        Task {
            do {
                let response = try await followService.followTalent()
                guard response.statusCode == 200 else { return }
                fetchDetails()
            } catch {
                print("Error in follow talent is \(error.localizedDescription)")
            }
            isLoading = false
        }
    }
    
    private func unfollowTalent() {
        isLoading = true
        Task {
            do {
                let response = try await followService.unfollowTalent()
                guard response.statusCode == 200 else { return }
                fetchDetails()
            } catch {
                print("Error in unfollow talent is \(error.localizedDescription)")
            }
            isLoading = false
        }
    }
    
    
    
    private func fetchTeamDetails() {
        isLoading = true
        Task {
            do {
                let response = try await detailsFetchingService.fetchTeamDetails(id: String(id))
                teamDetail = response
                teamDetails = response
                isFollowing = response.userFollowVoteStats?.following ?? false
                isVoting = response.userFollowVoteStats?.voting ?? false
            } catch {
                print("Details fetching service error is \(error.localizedDescription)")
            }
            isLoading = false
        }
    }
    
    private func filterSquadLists() -> [UpdateSquadTableViewCell.SquadModel] {
        var lists: [UpdateSquadTableViewCell.SquadModel] = []
        if let squad = teamDetails?.squad {
            if let headCoach = squad.headCoach {
                lists.append(.init(coach: headCoach))
            }
            if let assistantCoach = squad.assistantCoach {
                lists.append(.init(coach: assistantCoach))
            }
            if let technicalDirector = squad.technicalDirector {
                lists.append(.init(coach: technicalDirector))
            }
            if let analyst = squad.analyst {
                lists.append(.init(coach: analyst))
            }
            if !squad.roster.isEmpty {
                lists.append(.init(roaster: squad.roster))
            }
        
        }
        return lists
    }
    
    
    
    private func fetchPlayerDetails() {
        isLoading = true
        Task {
            do {
                let response = try await detailsFetchingService.fetchPlayerDetails(id: String(id))
                playerDetail = response
                playerDetails = response
                isFollowing = response.userFollowVoteStats?.following ?? false
                isVoting = response.userFollowVoteStats?.voting ?? false
            } catch {
                print("Details fetching service error is \(error.localizedDescription)")
            }
            isLoading = false
        }
    }
    
    private func fetchCasterDetails() {
        isLoading = true
        Task {
            do {
                let response = try await detailsFetchingService.fetchCasterDetails(id: String(id))
                casterDetail = response
                casterDetails = response
                isFollowing = response.userFollowVoteStats?.following ?? false
                isVoting = response.userFollowVoteStats?.voting ?? false
            } catch {
                print("Details fetching service error is \(error.localizedDescription)")
            }
            isLoading = false
        }
    }
    
    private func fetchCreatorDetails() {
        isLoading = true
        Task {
            do {
                let response = try await detailsFetchingService.fetchCreatorDetails(id: String(id))
                creatorDetail = response
                creatorDetails = response
                isFollowing = response.userFollowVoteStats?.following ?? false
                isVoting = response.userFollowVoteStats?.voting ?? false
            } catch {
                print("Details fetching service error is \(error.localizedDescription)")
            }
            isLoading = false
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
//            guard let vc = SquadModule.createModule(squad: teamDetails.squad) else { return UIViewController() }
            let vc = UpdateSquadController(lists: filterSquadLists())
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
