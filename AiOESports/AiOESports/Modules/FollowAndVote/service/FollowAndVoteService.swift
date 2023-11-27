//
//  FollowAndVoteService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation
import Alamofire


struct FollowAndVoteService: FollowAndVoteServiceProtocol {
    
    var url: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)")!
    }
    
    func fetchFollowedTeamList() async throws -> [FollowAndVoteTeam] {
        let url = url.appendingPathComponent("api/user/follow/team")
        guard let token = UserDataModel.shared.getToken() else {
            return []
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let request = AF.request(url, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        let baseModel = try decoder.decode(BaseResponseModel<[FollowAndVoteTeam]>.self, from: data)
        
        guard let list = baseModel.result else { return [] }
        
        return list
    }
    
    func fetchFollowedPlayerList() async throws -> [FollowAndVoteTalent] {
        let url = url.appendingPathComponent("api/user/follow/player")
        guard let token = UserDataModel.shared.getToken() else {
            return []
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let request = AF.request(url, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        let baseModel = try decoder.decode(BaseResponseModel<[FollowAndVoteTalent]>.self, from: data)
        
        guard let list = baseModel.result else { return [] }
        
        return list
    }
    
    func fetchFollowedCasterList() async throws -> [FollowAndVoteTalent] {
        let url = url.appendingPathComponent("api/user/follow/caster")
        guard let token = UserDataModel.shared.getToken() else {
            return []
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let request = AF.request(url, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        let baseModel = try decoder.decode(BaseResponseModel<[FollowAndVoteTalent]>.self, from: data)
        
        guard let list = baseModel.result else { return [] }
        
        return list
    }
    
    func fetchFollowedCreatorList() async throws -> [FollowAndVoteTalent] {
        let url = url.appendingPathComponent("api/user/follow/creator")
        guard let token = UserDataModel.shared.getToken() else {
            return []
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let request = AF.request(url, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        let baseModel = try decoder.decode(BaseResponseModel<[FollowAndVoteTalent]>.self, from: data)
        
        guard let list = baseModel.result else { return [] }
        
        return list
    }
    
    func fetchVotedTeamList() async throws -> [FollowAndVoteTeam] {
        let url = url.appendingPathComponent("api/user/rating/team")
        guard let token = UserDataModel.shared.getToken() else {
            return []
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        
        let request = AF.request(url, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        let baseModel = try decoder.decode(BaseResponseModel<[FollowAndVoteTeam]>.self, from: data)
        
        guard let list = baseModel.result else { return [] }
        
        return list
    }
    
    func fetchVotedPlayerList() async throws -> [FollowAndVoteTalent] {
        let url = url.appendingPathComponent("api/user/rating/player")
        guard let token = UserDataModel.shared.getToken() else {
            return []
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        
        let request = AF.request(url, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        let baseModel = try decoder.decode(BaseResponseModel<[FollowAndVoteTalent]>.self, from: data)
        
        guard let list = baseModel.result else { return [] }
        
        return list
    }
    
    func fetchVotedCasterList() async throws -> [FollowAndVoteTalent] {
        let url = url.appendingPathComponent("api/user/rating/caster")
        guard let token = UserDataModel.shared.getToken() else {
            return []
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        
        let request = AF.request(url, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        let baseModel = try decoder.decode(BaseResponseModel<[FollowAndVoteTalent]>.self, from: data)
        
        guard let list = baseModel.result else { return [] }
        
        return list
    }
    
    func fetchVotedCreatorList() async throws -> [FollowAndVoteTalent] {
        let url = url.appendingPathComponent("api/user/rating/creator")
        guard let token = UserDataModel.shared.getToken() else {
            return []
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        
        let request = AF.request(url, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        let baseModel = try decoder.decode(BaseResponseModel<[FollowAndVoteTalent]>.self, from: data)
        
        guard let list = baseModel.result else { return [] }
        
        return list
    }
    
}
