//
//  PinViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/03/2023.
//

import Foundation



protocol PinViewDelegate {
    func didFinishedEnterCode(password: String)
    func didFinishedConfirmCode(isMatched: Bool)
    func didTapDeleteButton()
}
