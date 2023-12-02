//
//  VotingServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/12/2023.
//

import Foundation


protocol VotingServiceProtocol {
    func voteTeam(id: String) async throws -> BaseResponseModel<Empty>
    func voteTalent(id: String) async throws -> BaseResponseModel<Empty>
}
