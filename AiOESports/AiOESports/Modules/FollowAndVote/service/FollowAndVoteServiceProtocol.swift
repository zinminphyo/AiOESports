//
//  FollowAndVoteServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation


protocol FollowAndVoteServiceProtocol {
    func fetchFollowedTeamList() async throws -> [FollowAndVoteTeam]
    func fetchFollowedPlayerList() async throws -> [FollowAndVoteTalent]
    func fetchFollowedCasterList() async throws -> [FollowAndVoteTalent]
    func fetchFollowedCreatorList() async throws -> [FollowAndVoteTalent]
    func fetchVotedTeamList() async throws -> [FollowAndVoteTeam]
    func fetchVotedPlayerList() async throws -> [FollowAndVoteTalent]
    func fetchVotedCasterList() async throws -> [FollowAndVoteTalent]
    func fetchVotedCreatorList() async throws -> [FollowAndVoteTalent]
}
