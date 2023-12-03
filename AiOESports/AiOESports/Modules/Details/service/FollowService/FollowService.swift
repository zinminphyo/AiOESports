//
//  FollowService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/12/2023.
//

import Foundation
import Alamofire


struct FollowService: FollowServiceProtocol {
    
    let id: String
    
    var baseURL: URL {
        return URL(string: "\(NetworkBaseURLs.shared.baseURL)")!
    }
    
    func followTeam() async throws -> BaseResponseModel<Int> {
        let url = baseURL.appendingPathComponent("api/follow/team/\(id)")
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(token)"
        ]
        let params: Parameters = [
            "follow" : "true"
        ]
        let request = AF.request(url, method: .post, parameters: params, headers: headers).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(BaseResponseModel<Int>.self, from: data)
    }
    
    func followTalent() async throws -> BaseResponseModel<Empty> {
        let url = baseURL.appendingPathComponent("api/follow/talent/\(id)")
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(token)"
        ]
        let params: Parameters = [
            "follow" : "true"
        ]
        let request = AF.request(url, method: .post, parameters: params, headers: headers).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(BaseResponseModel<Empty>.self, from: data)
    }
    
    func unFollowTeam() async throws -> BaseResponseModel<Empty> {
        let url = baseURL.appendingPathComponent("api/follow/team/\(id)")
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(token)"
        ]
        let params: Parameters = [
            "follow" : "false"
        ]
        let request = AF.request(url, method: .post, parameters: params, headers: headers).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(BaseResponseModel<Empty>.self, from: data)
    }
    
    func unfollowTalent() async throws -> BaseResponseModel<Empty> {
        let url = baseURL.appendingPathComponent("api/follow/talent/\(id)")
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(token)"
        ]
        let params: Parameters = [
            "follow" : "false"
        ]
        let request = AF.request(url, method: .post, parameters: params, headers: headers).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(BaseResponseModel<Empty>.self, from: data)
    }
    
    
}
