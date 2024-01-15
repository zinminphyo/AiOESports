//
//  ForceVersionResponse.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import Foundation
import Alamofire


struct ForceVersionService: ForceVersionServiceProtocol {
    
    var url: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/getversion")!
    }
    
    func fetchForceVersion() async throws -> ForceVersionResponse {
        let request = AF.request(url, method: .get).serializingData()
        let response = await request.response
        let data = try response.result.get()
        let decoder = JSONDecoder()
        let baseResponse = try decoder.decode(BaseResponseModel<ForceVersionResponse>.self, from: data)
        guard let res = baseResponse.result else {
            fatalError()
        }
        return res
    }
}
