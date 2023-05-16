//
//  LoginInteracting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/05/2023.
//

import Foundation



protocol LoginInteracting {
    var presenter: LoginPresenting? { get set }
    func login(phoneNum: String, password: String)
}
