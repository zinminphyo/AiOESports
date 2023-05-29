//
//  RegistrationView+State.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/05/2023.
//

import Foundation


enum RegistrationViewRenderState {
    case success
    case fieldRequiredFailure
    case apiFailure(error: String)
    case passwordNotMatch
}
