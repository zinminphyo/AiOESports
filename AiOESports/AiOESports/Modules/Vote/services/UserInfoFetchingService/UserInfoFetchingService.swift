//
//  UserInfoFetchingService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/12/2023.
//

import Foundation
import Alamofire


struct UserInfoFetchingService: UserInfoFetchingServiceProtocol {
    
    var url: URL {
        return URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/user/data")!
    }
    
    func fetchUserInfo() async throws -> UserInfo {
        guard let token = UserDataModel.shared.getToken() else {
            throw AuthrizationError.cannotRetrieveToken
        }
        let header: HTTPHeaders = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let request = AF.request(url, method: .get, headers: header).serializingData()
        
        let response = await request.response
        let data = try response.result.get()
        let decoder = JSONDecoder()
        let baseResponse = try decoder.decode(BaseResponseModel<UserInfo>.self, from: data)
        guard let userInfo = baseResponse.result else {
            throw UserInfoFetchingError.empty
        }
        return userInfo
    }
}
