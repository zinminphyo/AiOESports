//
//  FollowAndVoteViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation
import Combine



class FollowAndVoteViewModel {
    
    var fetchingStatus = PassthroughSubject<FetchingStatus, Never>()
    
    @Published
    var followedTeamList = [FollowAndVoteTeam]()
    var fetchingStatusFollowedTeamList = PassthroughSubject<FetchingStatus, Never>()
    
    @Published
    var followedPlayerList = [FollowAndVoteTalent]()
    var fetchingStatusFollowedPlayerList = PassthroughSubject<FetchingStatus, Never>()
    
    @Published
    var followedCasterList = [FollowAndVoteTalent]()
    var fetchingStatusFollowedCasterList = PassthroughSubject<FetchingStatus, Never>()
    
    @Published
    var followedCreatorList = [FollowAndVoteTalent]()
    var fetchingStatusFollowedCreatorList = PassthroughSubject<FetchingStatus, Never>()
    
    @Published
    var votedTeamList = [FollowAndVoteTeam]()
    var fetchingStatusVotedTeamList = PassthroughSubject<FetchingStatus, Never>()
    
    @Published
    var votedPlayerList = [FollowAndVoteTalent]()
    var fetchingStatusVotedPlayerList = PassthroughSubject<FetchingStatus, Never>()
    
    @Published
    var votedCasterList = [FollowAndVoteTalent]()
    var fetchingStatusVotedCasterList = PassthroughSubject<FetchingStatus, Never>()
    
    @Published
    var votedCreatorList = [FollowAndVoteTalent]()
    var fetchingStatusVotedCreatorList = PassthroughSubject<FetchingStatus, Never>()
    
    enum FetchingStatus {
        case isFetching
        case completed
    }
    
    private let service = FollowAndVoteService()
    
    
    func fetchFollowedTeamList() async throws {
        /*
        fetchingStatusFollowedTeamList.send(.isFetching)
        Task {
            do {
                followedTeamList = try await service.fetchFollowedTeamList()
            } catch {
                print("Error in followed team list \(error.localizedDescription)")
            }
            fetchingStatusFollowedTeamList.send(.completed)
        }
         */
    }
    
    func fetchFollowedPlayerList() async throws {
        /*
        fetchingStatusFollowedPlayerList.send(.isFetching)
        Task {
            do {
                followedPlayerList = try await service.fetchFollowedPlayerList()
            } catch {
                print("Error in followed player list \(error.localizedDescription)")
            }
            fetchingStatusFollowedPlayerList.send(.completed)
        }
         */
        
    }
    
    func fetchFollowedCasterList() {
        /*
        fetchingStatusFollowedCasterList.send(.isFetching)
        Task {
            do {
                followedCasterList = try await service.fetchFollowedCasterList()
            } catch {
                print("Error in followed caster list \(error.localizedDescription)")
            }
        }
         */
    }
    
    func fetchFollowedCreatorList() async throws {
        
    }
    
    func fetchVotedTeamList() {}
    
    func fetchVotedPlayerList() {}
    
    func fetchVotedCreatorList() {}
    
    func fetchVotedCasterList() {}
    
    func fetchFollowAndVoteList() {
        fetchingStatus.send(.isFetching)
        Task {
            do {
                followedTeamList = try await service.fetchFollowedTeamList()
                followedPlayerList = try await service.fetchFollowedPlayerList()
                followedCasterList = try await service.fetchFollowedCasterList()
                followedCreatorList = try await service.fetchFollowedCreatorList()
                
                votedTeamList = try await service.fetchVotedTeamList()
                votedPlayerList = try await service.fetchVotedPlayerList()
                votedCasterList = try await service.fetchVotedCasterList()
                votedCreatorList = try await service.fetchVotedCreatorList()
            } catch {
                print("Error in follow in vote is \(error.localizedDescription)")
            }
            fetchingStatus.send(.completed)
        }
    }
    
}
