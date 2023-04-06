//
//  NetworkService.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/04/2023.
//

import Foundation
import Alamofire

class NetworkService {
    	
    private init() {}
    
    static let shared = NetworkService()
    
    func request<T:Decodable>(router: ApiRouter, onCompletion: @escaping (Result<T,NetworkError>) -> Swift.Void) {
        do {
            let request = try router.asURL()
            AF.request(request, method: router.method, parameters: router.parameter, encoding: router.encoding, headers: router.header, interceptor: nil, requestModifier: nil)
                .responseDecodable { (response: DataResponse<T,AFError>) in
                    switch response.result {
                    case .success(let result):
                        onCompletion(.success(result))
                    case .failure(let error):
                        switch response.response?.statusCode {
                        case 401:
                            onCompletion(.failure(.unauthorized))
                        case 404:
                            onCompletion(.failure(.notFound))
                        case 500:
                            onCompletion(.failure(.internalServerError))
                        default:
                            onCompletion(.failure(.customError(error.localizedDescription)))
                        }
                    }
                }
        }  catch {
            onCompletion(.failure(.customError("Can't convert into url request.")))
        }
    }
}
