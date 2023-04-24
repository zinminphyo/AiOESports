//
//  LoginPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 23/04/2023.
//

import Foundation


protocol LoginPresenting {
    var viewDelegate: LoginViewDelegate? { get set }
    var router: LoginRouting? { get set }
    func didTapRemeberInfoView()
    func didChangePhoneNumber(phoneNum: String)
    func didChangePassword(password: String)
    func tappedRegisterBtn()
}
