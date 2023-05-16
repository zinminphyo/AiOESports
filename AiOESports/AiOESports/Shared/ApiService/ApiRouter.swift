//
//  ApiRouter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/04/2023.
//

import Foundation
import Alamofire


enum ApiRouter: URLConvertible {
    
    case home
    case fetchTeamLists(_ gameType: GameType, _ filterStatus: FilterStatus,_ page: Int)
    case fetchPlayerLists(_ gameType: GameType, _ filterStatus: PlayerFilterStatus, _ page: Int)
    case fetchCreatorLists(_ gameType: GameType, _ filterStatus: FilterStatus, _ page: Int)
    case fetchCasterLists(_ gameType: GameType, _ filterStatus: FilterStatus, _ page: Int)
    case teamSearch(_ keyword: String)
    case playerSearch(_  keyword: String)
    case casterSearch(_ keyword: String)
    case creatorSearch(_ keyword: String)
    case teamDetails(Int)
    case playerDetails(Int)
    case casterDetails(Int)
    case creatorDetails(Int)
    
    // Login
    case login(_ phoneNum: String, _ password: String)
    
    func asURL() throws -> URL {
        return URL(string: url)!
    }
    
    var baseURL: String {
        return NetworkBaseURLs.shared.baseURL
    }
    
    var api: String {
        return "api"
    }
    
    var path: String {
        switch self {
        case .home:
            return "home"
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
        case .playerSearch:
            return "player/search"
        case .casterSearch:
            return "caster/search"
        case .creatorSearch:
            return "creator/search"
        case let .teamDetails(id):
            return "team/\(id)"
        case let .playerDetails(id):
            return "player/\(id)"
        case let .casterDetails(id):
            return "caster/\(id)"
        case let .creatorDetails(id):
            return "creator/\(id)"
        case .login:
            return "login"
        }
    }
    
    var url: String {
        return baseURL+"/"+api+"/"+path
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchTeamLists, .fetchPlayerLists, .fetchCasterLists, .fetchCreatorLists, .teamDetails, .playerDetails, .casterDetails, .creatorDetails, .home:
            return URLEncoding.default
        case .teamSearch, .playerSearch, .casterSearch, .creatorSearch, .login:
            return JSONEncoding.prettyPrinted
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .fetchTeamLists, .teamSearch, .fetchPlayerLists, .fetchCreatorLists, .fetchCasterLists, .teamDetails, .playerDetails, .casterDetails, .creatorDetails, .playerSearch, .casterSearch, .creatorSearch, .home, .login:
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
        case let .playerSearch(keyword):
            return [
                "keyword" : keyword
            ]
        case let .casterSearch(keyword):
            return [
                "keyword" : keyword
            ]
        case let .creatorSearch(keyword):
            return [
                "keyword" : keyword
            ]
        case .teamDetails:
            return nil
        case .playerDetails, .casterDetails, .creatorDetails, .home:
            return nil
            
        case let .login(phNum, pass):
            return [
                "phone-number" : phNum,
                "password" : pass
            ]
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
        case .teamSearch, .playerSearch, .casterSearch, .creatorSearch:
            return .post
        case .teamDetails:
            return .get
        case .playerDetails, .casterDetails, .creatorDetails, .home:
            return .get
        case .login:
            return .post
        }
    }
    
}


