//
//  RegistrationView+State.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/05/2023.
//

import Foundation


enum RegistrationViewRenderState: Equatable {
    case success
    case fieldRequiredFailure
    case apiFailure(error: String)
    case passwordNotMatch
    
    var errorString: String? {
        switch self {
        case .success:
            return nil
        case .fieldRequiredFailure:
            return "This field is required"
        case .apiFailure(let error):
            return error
        case .passwordNotMatch:
            return "Password didn't match."
        }
    }
}
