//
//  ShieldHistoryService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 19/01/2024.
//

import Foundation
import Alamofire

let mockedData = """
{
    "result": [
        {
            "id": 18,
            "user_id": "8",
            "amount": 99,
            "description": "Upgrade Premium",
            "detail": "Premium User",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 19,
            "user_id": "8",
            "amount": 100000,
            "description": "Official Support",
            "detail": "Blacklist international",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 19,
            "user_id": "8",
            "amount": 100000,
            "description": "Official Support",
            "detail": "Blacklist international",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 19,
            "user_id": "8",
            "amount": 100000,
            "description": "Official Support",
            "detail": "Blacklist international",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 19,
            "user_id": "8",
            "amount": 100000,
            "description": "Official Support",
            "detail": "Blacklist international",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 19,
            "user_id": "8",
            "amount": 100000,
            "description": "Official Support",
            "detail": "Blacklist international",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 19,
            "user_id": "8",
            "amount": 100000,
            "description": "Official Support",
            "detail": "Blacklist international",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 19,
            "user_id": "8",
            "amount": 100000,
            "description": "Official Support",
            "detail": "Blacklist international",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 19,
            "user_id": "8",
            "amount": 100000,
            "description": "Official Support",
            "detail": "Blacklist international",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 19,
            "user_id": "8",
            "amount": 100000,
            "description": "Official Support",
            "detail": "Blacklist international",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 18,
            "user_id": "8",
            "amount": 99,
            "description": "Upgrade Premium",
            "detail": "Premium User",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 18,
            "user_id": "8",
            "amount": 99,
            "description": "Upgrade Premium",
            "detail": "Premium User",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 18,
            "user_id": "8",
            "amount": 99,
            "description": "Upgrade Premium",
            "detail": "Premium User",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        },
        {
            "id": 18,
            "user_id": "8",
            "amount": 99,
            "description": "Upgrade Premium",
            "detail": "Premium User",
            "talent_id": null,
            "team_id": "-",
            "created_at": "2024-01-16T11:33:31.000000Z",
            "updated_at": "2024-01-16T11:33:31.000000Z"
        }
    ],
    "statusCode": 200,
    "message": "User Shield History"
}
"""


class ShieldHistoryService: ShieldHistoryServiceProtocol {
    var url: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/user/shield/history")!
    }
    func fetchLists() async throws -> ShieldHistories {
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let headers: HTTPHeaders = [
            HTTPHeader(name: "Authorization",
                       value: "Bearer \(token)")
        ]
        let request = AF.request(url, method: .get, headers: headers).serializingData()
        let response = await request.response
        let data = try response.result.get()
//        guard let data = mockedData.data(using: .utf8) else {
//            fatalError()
//        }
        let decoder = JSONDecoder()
        let baseResponse = try decoder.decode(BaseResponseModel<ShieldHistories>.self, from: data)
        return baseResponse.result ?? []
    }
}
