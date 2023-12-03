//
//  VotingServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/12/2023.
//

import Foundation


protocol VotingServiceProtocol {
    func voteTeam(id: String, star: Int, comment: String) async throws -> BaseResponseModel<Empty>
    func voteTalent(id: String, star: Int, comment: String) async throws -> BaseResponseModel<Empty>
}
