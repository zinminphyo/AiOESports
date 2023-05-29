//
//  RegisterInteracting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/05/2023.
//

import Foundation


protocol RegisterInteracting {
    var presenter: RegisterPresenting? { get set }
    func registerStep1(userName: String, phNum: String, password: String)
}
