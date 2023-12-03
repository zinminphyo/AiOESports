//
//  CreatorOverviewViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/04/2023.
//

import Foundation


protocol CreatorOverviewViewDelegate {
    var presenter: CreatorOverviewPresenting? { get set }
    func renderUI(details: CasterDetails)
}
