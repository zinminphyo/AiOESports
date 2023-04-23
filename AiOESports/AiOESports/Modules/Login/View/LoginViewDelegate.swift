//
//  LoginViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 23/04/2023.
//

import Foundation


protocol LoginViewDelegate {
    var presenter: LoginPresenting? { get set }
    func updateRememberInfoFlag(flag: Bool)
    func updateLoginButtton(isCompleted: Bool)
}
