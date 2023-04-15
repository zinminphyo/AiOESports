//
//  CreatorOverviewPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/04/2023.
//

import Foundation


protocol CreatorOverviewPresenting {
    var viewDelegate: CreatorOverviewViewDelegate? { get set }
    func viewDidLoad()
}
