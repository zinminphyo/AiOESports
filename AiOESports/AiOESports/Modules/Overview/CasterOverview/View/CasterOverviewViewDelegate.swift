//
//  CasterOverviewViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation


protocol CasterOverviewViewDelegate {
    var presenter: CasterOverviewPresenting? { get set }
    func renderUI(details: CasterDetails)
}
