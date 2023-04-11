//
//  TeamOverviewPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


protocol TeamOverviewPresenting {
    var viewDelegate: TeamOverviewViewDelegate? { get set }
    func viewDidLoad()
}
