//
//  ProfileUpdateService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 26/11/2023.
//

import Foundation
import Alamofire

struct ProfileUpdateService: ProfileUpdateServiceProtocol {
    
    var url: URL {
        return URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/user/update")!
    }
    
    func update(updateInfo: [String : Any]) async throws -> BaseResponseModel<LoginResponseModel> {
        let token = UserDataModel.shared.getToken() ?? ""
        let header = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let url = url.appendingPathComponent("1026")
        print("Full url is \(url.absoluteString)")
        let request = AF.upload(multipartFormData: { formData in
            for (key, value) in updateInfo {
                if let value = value as? String {
                    formData.append(value.data(using: .utf8)!, withName: key)
                }
            }
        }, to: url, headers: header).responseJSON(completionHandler: { response in
            print("Response is \(response)")
        }).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(BaseResponseModel<LoginResponseModel>.self, from: data)
    }
    
}
