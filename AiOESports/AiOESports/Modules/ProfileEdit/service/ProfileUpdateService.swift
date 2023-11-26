//
//  ProfileUpdateService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 26/11/2023.
//

import Foundation
import Alamofire
import UIKit

struct ProfileUpdateService: ProfileUpdateServiceProtocol {
    
    var url: URL {
        return URL(string: "\(NetworkBaseURLs.shared.baseURL)/api/user/update")!
    }
    
    func update(updateInfo: [String : Any]) async throws -> BaseResponseModel<UpdateResponseModel> {
        let token = UserDataModel.shared.getToken() ?? ""
        let header = HTTPHeaders([
            HTTPHeader(name: "Authorization", value: "Bearer \(token)")
        ])
        let url = url.appendingPathComponent("1026")
        let request = AF.upload(multipartFormData: { formData in
            for (key, value) in updateInfo {
                if let value = value as? String {
                    formData.append(value.data(using: .utf8)!, withName: key)
                }
                if let image = value as? UIImage {
                    guard let data = image.jpegData(compressionQuality: 0.8) else { return }
                    formData.append(data, withName: key, fileName: "profile.jpeg", mimeType: "image/*")
                }
            }
        }, to: url, headers: header).serializingData()
        
        let response = await request.response
        
        let data = try response.result.get()
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(BaseResponseModel<UpdateResponseModel>.self, from: data)
    }
    
}
