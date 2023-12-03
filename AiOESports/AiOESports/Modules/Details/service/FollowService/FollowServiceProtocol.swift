//
//  FollowServiceProtocol.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/12/2023.
//

import Foundation


protocol FollowServiceProtocol {
    func followTeam() async throws -> BaseResponseModel<Int>
    func followTalent() async throws -> BaseResponseModel<Empty>
    func unFollowTeam() async throws -> BaseResponseModel<Empty>
    func unfollowTalent() async throws -> BaseResponseModel<Empty>
}
