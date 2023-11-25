//
//  RegistrationError.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/05/2023.
//

import Foundation


enum RegistrationError {
    case fieldRequried
    case apiError(error: NetworkError)
    case passwordDoNotMatch
}
