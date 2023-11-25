//
//  RegisterInteractor.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/05/2023.
//

import Foundation

class RegisterInteractor: RegisterInteracting {
    
    var presenter: RegisterPresenting?
    
    func registerStep1(userName: String, phNum: String, password: String) {
        let router = ApiRouter.registerStep1(userName: userName, phNum: phNum, password: password)
        NetworkService.shared.request(router: router) { (result: Result<BaseResponseModel<RegisterResponseModel>,NetworkError>) in
            switch result {
            case let .success(model):
                self.presenter?.didFinishedStep1Registration(responseModel: model.result, error: nil)
            case let .failure(error):
                self.presenter?.didFinishedStep1Registration(responseModel: nil, error: error.localizedDescription)
            }
        }
    }
    
    
}
