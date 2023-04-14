//
//  CareerViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation


protocol CareerViewDelegate {
    var presenter: CareerPresenting? { get set }
    func renderCareerLists(lists: [CareerModel])
}
