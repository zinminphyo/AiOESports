//
//  GetDetailsService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/12/2023.
//

import Foundation
import Alamofire


struct GetDetailsService: GetDetailsServiceProtocol {
    
    var baseURL: URL {
        return URL(string: "\(NetworkBaseURLs.shared.baseURL)")!
    }
    
    func fetchTeamDetails(id: String) async throws -> TeamDetails {
        if UserDataModel.shared.getToken() == nil {
            return try await fetchTeamDetailsWithoutAuth(id: id)
        } else {
            return try await fetchTeamDetailsWithAuth(id: id)
        }
    }
    
    func fetchPlayerDetails(id: String) async throws -> PlayerDetails {
        if UserDataModel.shared.getToken() == nil {
            return try await fetchPlayerDetailsWithoutAuth(id: id)
        } else {
            return try await fetchPlayerDetailsWithAuth(id: id)
        }
    }
    
    func fetchCasterDetails(id: String) async throws -> CasterDetails {
        if UserDataModel.shared.getToken() == nil {
            return try await fetchCasterDetailsWithoutAuth(id: id)
        } else {
            return try await fetchCasterDetailsWithAuth(id: id)
        }
    }
    
    func fetchCreatorDetails(id: String) async throws -> CasterDetails {
        if UserDataModel.shared.getToken() == nil {
            return try await fetchCreatorDetailsWithoutAuth(id: id)
        } else {
            return try await fetchCreatorDetailsWithAuth(id: id)
        }
    }
    
    private func fetchTeamDetailsWithAuth(id: String) async throws -> TeamDetails {
        let url = baseURL.appendingPathComponent("api/user/team/\(id)")
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let header: HTTPHeaders = [
            "Authorization" : "Bearer \(token)"
        ]
        let request = AF.request(url, method: .get, headers: header).serializingData()
        let response = await request.response
        let data = try response.result.get()
        let decoder = JSONDecoder()
        return try decoder.decode(TeamDetails.self, from: data)
    }
    
    private func fetchTeamDetailsWithoutAuth(id: String) async throws -> TeamDetails  {
        let url = baseURL.appendingPathComponent("api/team/\(id)")
        let request = AF.request(url, method: .get).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(TeamDetails.self, from: data)
    }
    
    
}

// MARK: - Player Details Concrete Function
extension GetDetailsService {
    private func fetchPlayerDetailsWithAuth(id: String) async throws -> PlayerDetails {
        let url = baseURL.appendingPathComponent("api/user/player/\(id)")
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let header: HTTPHeaders = [
            "Authorization" : "Bearer \(token)"
        ]
        let request = AF.request(url, method: .get, headers: header).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(PlayerDetails.self, from: data)
    }
    
    private func fetchPlayerDetailsWithoutAuth(id: String) async throws -> PlayerDetails {
        let url = baseURL.appendingPathComponent("api/player/\(id)")
        let request = AF.request(url, method: .get).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(PlayerDetails.self, from: data)
    }
}

// MARK: - Caster Details Concrete Function
extension GetDetailsService {
    private func fetchCasterDetailsWithAuth(id: String) async throws -> CasterDetails {
        let url = baseURL.appendingPathComponent("api/user/caster/\(id)")
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let header: HTTPHeaders = [
            "Authorization" : "Bearer \(token)"
        ]
        let request = AF.request(url, method: .get, headers: header).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(CasterDetails.self, from: data)
    }
    
    private func fetchCasterDetailsWithoutAuth(id: String) async throws -> CasterDetails {
        let url = baseURL.appendingPathComponent("api/caster/\(id)")
        let request = AF.request(url, method: .get).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(CasterDetails.self, from: data)
    }
}


// MARK: - Creator Details Concrete Function
extension GetDetailsService {
    private func fetchCreatorDetailsWithAuth(id: String) async throws -> CasterDetails {
        let url = baseURL.appendingPathComponent("api/user/creator/\(id)")
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let header: HTTPHeaders = [
            "Authorization" : "Bearer \(token)"
        ]
        let request = AF.request(url, method: .get, headers: header).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(CasterDetails.self, from: data)
    }
    
    private func fetchCreatorDetailsWithoutAuth(id: String) async throws -> CasterDetails {
        let url = baseURL.appendingPathComponent("api/creator/\(id)")
        let request = AF.request(url, method: .get).serializingData()
        let response = await request.response
        let data = try response.result.get()
        return try JSONDecoder().decode(CasterDetails.self, from: data)
    }
}
