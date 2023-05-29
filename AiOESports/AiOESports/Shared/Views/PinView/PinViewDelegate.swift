//
//  PinViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/03/2023.
//

import Foundation



protocol PinViewDelegate {
    func didFinishedEnterCode(pinView: PinView, password: String)
    func didFinishedConfirmCode(pinView: PinView, isMatched: Bool)
    func didTapDeleteButton(pinView: PinView)
}
