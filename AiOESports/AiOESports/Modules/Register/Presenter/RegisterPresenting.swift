//
//  RegisterPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 23/04/2023.
//

import Foundation


protocol RegisterPresenting {
    var viewDelegate: RegisterViewDelegate? { get set }
    var interactor: RegisterInteracting? { get set }
    func viewDidLoad()
    func register(userName: String)
    func didFinishedStep1Registration(responseModel: RegisterResponseModel?, error: String?)
}
