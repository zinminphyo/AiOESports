//
//  VotingService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/12/2023.
//

import Foundation
import Alamofire

struct VotingService: VotingServiceProtocol {
    
    var teamVoteURL: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/vote/team")!
    }
    
    var talentVoteURL: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/vote/talent")!
    }
    
    func voteTeam(id: String) async throws -> BaseResponseModel<Empty> {
        let url = teamVoteURL.appendingPathComponent(id)
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let request = AF.request(url, method: .post, headers: header).serializingData()
        let response = await request.response
        let data = try response.result.get()
        let decoder = JSONDecoder()
        return try decoder.decode(BaseResponseModel<Empty>.self, from: data)
    }
    
    func voteTalent(id: String) async throws -> BaseResponseModel<Empty> {
        let url = talentVoteURL.appendingPathComponent(id)
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let request = AF.request(url, method: .post, headers: header).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(BaseResponseModel<Empty>.self, from: data)
    }
    
    
}
