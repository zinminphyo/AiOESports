//
//  LoginInteractor.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/05/2023.
//

import Foundation



class LoginInteractor: LoginInteracting {
    
    var presenter: LoginPresenting?
    
    func login(phoneNum: String, password: String) {
        let router = ApiRouter.login(phoneNum, password)
        NetworkService.shared.request(router: router) { (result: Result<BaseResponseModel<LoginResponseModel>, NetworkError>) in
            switch result {
            case .success(let success):
                self.presenter?.didFinishedLogin(user: success.result.user, error: nil)
            case .failure(let failure):
                self.presenter?.didFinishedLogin(user: nil, error: failure.localizedDescription)
            }
        }
    }
    
    
}
