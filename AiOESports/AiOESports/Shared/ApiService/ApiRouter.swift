//
//  ApiRouter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/04/2023.
//

import Foundation
import Alamofire


enum ApiRouter: URLConvertible {
    
    case fetchTeamLists(_ gameType: GameType, _ filterStatus: FilterStatus)
    case teamSearch(_ keyword: String)
    
    func asURL() throws -> URL {
        return URL(string: url)!
    }
    
    var baseURL: String {
        return "https://40ff4fbc07a9ea57c3758da089c572b1.aioesports.com"
    }
    
    var api: String {
        return "api"
    }
    
    var path: String {
        switch self {
        case .fetchTeamLists, .teamSearch:
            return "team"
        }
    }
    
    var url: String {
        return baseURL+"/"+api+"/"+path
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchTeamLists:
            return URLEncoding.default
        case .teamSearch:
            return URLEncoding.httpBody
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchTeamLists, .teamSearch:
            return nil
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case let .fetchTeamLists(gameType,filterstatus):
            return [
                "gameType" : gameType.value,
                "status" : filterstatus.value
            ]
        case let .teamSearch(keyword):
            return [
                "keyword" : keyword
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchTeamLists:
            return .get
        case .teamSearch:
            return .post
        }
    }
    
}


