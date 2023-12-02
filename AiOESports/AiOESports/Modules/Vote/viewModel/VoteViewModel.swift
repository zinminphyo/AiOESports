//
//  VoteViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/11/2023.
//

import Foundation
import Combine


class VoteViewModel {
    
    private let userInfoFetchingService = UserInfoFetchingService()
    private let votingService = VotingService()
    
    private let userId: String
    
    let voteInfo: VoteInfo
    
    struct VoteInfo {
        let imageURL: String
        let name: String
        let game: String
        let rank: String
        let location: String
        let totalRatingStar: String
        let coverImageURL: String
        let id: String
        let type: VotingType
        enum VotingType {
            case team
            case talent
        }
    }
    
    @Published
    var userInfo: UserInfo? = nil
    
    @Published
    var commentStatus: CommentStatus = .input
    enum CommentStatus {
        case input
        case preview
        case submit
    }
    
    var votingResult = PassthroughSubject<VoteResult, Never>()
    enum VoteResult {
        case success
        case failed(error: String)
    }
    
    
    init(userid: Int, voteInfo: VoteInfo) {
        userId = String(userid)
        self.voteInfo = voteInfo
    }
    
    func fetchUserData() {
        Task {
            do {
                userInfo = try await userInfoFetchingService.fetchUserInfo()
            } catch {
                print("Error in fetching user data is \(error.localizedDescription)")
            }
        }
    }
    
    func vote() {
        let type = voteInfo.type
        switch type {
        case .team:
            voteTeam()
        case .talent:
            voteTalent()
        }
    }
    
    func voteTalent() {
        Task {
            do {
                let response = try await votingService.voteTalent(id: voteInfo.id)
                if response.statusCode == 200 { votingResult.send(.success) } else { votingResult.send(.failed(error: response.message)) }
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
    func voteTeam() {
        Task {
            do {
                let response = try await votingService.voteTalent(id: voteInfo.id)
                if response.statusCode == 200 { votingResult.send(.success) }
                else { votingResult.send(.failed(error: response.message)) }
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
}
