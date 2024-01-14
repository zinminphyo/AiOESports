//
//  BuyShieldsServic.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/01/2024.
//

import Foundation
import Alamofire


struct BuyShieldsService: BuyShieldsServiceProtocol {
    var url: URL {
        URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/admin/info")!
    }
    
    func fetchLists() async throws -> BuyShieldsResponse {
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
        let baseResponse = try decoder.decode(BaseResponseModel<BuyShieldsResponse>.self, from: data)
        guard let shieldResponse = baseResponse.result else {
            fatalError("Response is empty")
        }
        return shieldResponse
    }
    
    
}
