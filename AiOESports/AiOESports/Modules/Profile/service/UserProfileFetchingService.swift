//
//  UserProfileFetchingService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/11/2023.
//

import Foundation
import Alamofire

struct UserProfileFetchingService: UserProfileFetchingServiceProrocol {
    
    var url: URL {
        return URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/user/data")!
    }
    
    func fetchUserProfile() async throws -> BaseResponseModel<UserProfileResponseModel> {
        let token = UserDataModel.shared.getToken() ?? ""
        let headers = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let request = AF.request(url, method: .get, headers: headers).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(BaseResponseModel<UserProfileResponseModel>.self, from: data)
    }
    
}
