//
//  ApiRouter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/04/2023.
//

import Foundation
import Alamofire


enum ApiRouter: URLConvertible {
    
    case fetchTeamLists(_ gameType: GameType, _ filterStatus: FilterStatus,_ page: Int)
    case fetchPlayerLists(_ gameType: GameType, _ filterStatus: PlayerFilterStatus, _ page: Int)
    case fetchCreatorLists(_ gameType: GameType, _ filterStatus: FilterStatus, _ page: Int)
    case fetchCasterLists(_ gameType: GameType, _ filterStatus: FilterStatus, _ page: Int)
    case teamSearch(_ keyword: String)
    case teamDetails(Int)
    
    func asURL() throws -> URL {
        return URL(string: url)!
    }
    
    var baseURL: String {
//        return "https://40ff4fbc07a9ea57c3758da089c572b1.aioesports.com"
        return NetworkBaseURLs.shared.baseURL
    }
    
    var api: String {
        return "api"
    }
    
    var path: String {
        switch self {
        case .fetchTeamLists:
            return "team"
        case .fetchPlayerLists:
            return "player"
        case .fetchCreatorLists:
            return "creator"
        case .fetchCasterLists:
            return "caster"
        case  .teamSearch:
            return "team/search"
        case let .teamDetails(id):
            return "team/\(id)"
        }
    }
    
    var url: String {
        return baseURL+"/"+api+"/"+path
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchTeamLists, .fetchPlayerLists, .fetchCasterLists, .fetchCreatorLists, .teamDetails :
            return URLEncoding.default
        case .teamSearch:
            return JSONEncoding.prettyPrinted
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchTeamLists, .teamSearch, .fetchPlayerLists, .fetchCreatorLists, .fetchCasterLists, .teamDetails:
            return nil
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case let .fetchTeamLists(gameType,filterstatus,page):
            return [
                "gameType" : gameType.value,
                "status" : filterstatus.value,
                "page" : page
            ]
        case let .fetchPlayerLists(gameType, filterStatus, page):
            return [
                "gameType" : gameType.value,
                "status" : filterStatus.value,
                "page" : page
            ]
        case let .fetchCasterLists(gameType, status, page):
            return [
                "gameType" : gameType.value,
                "status" : status.value,
                "page" : page
            ]
        case let .fetchCreatorLists(gameType, status, page):
            return [
                "gameType" : gameType.value,
                "status" : status.value,
                "page" : page
            ]
        case let .teamSearch(keyword):
            return [
                "keyword" : keyword
            ]
        case .teamDetails:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchTeamLists:
            return .get
        case .fetchPlayerLists:
            return .get
        case .fetchCasterLists:
            return .get
        case .fetchCreatorLists:
            return .get
        case .teamSearch:
            return .post
        case .teamDetails:
            return .get
        }
    }
    
}


