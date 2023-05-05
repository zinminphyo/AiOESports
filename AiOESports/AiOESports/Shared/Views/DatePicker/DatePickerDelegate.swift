//
//  DatePickerDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/05/2023.
//

import Foundation


protocol DatePickerDelegate {
    func didTapCancel()
    func didTapSet(date: Date)
}
