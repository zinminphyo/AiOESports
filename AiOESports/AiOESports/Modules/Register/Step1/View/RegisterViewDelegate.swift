//
//  RegisterViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 23/04/2023.
//

import Foundation


protocol RegisterViewDelegate {
    var presenter: RegisterPresenter? { get set }
    func render(state: RegistrationViewRenderState)
}
