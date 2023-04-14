//
//  CasterOverviewPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation


protocol CasterOverviewPresenting {
    var viewDelegate: CasterOverviewViewDelegate? { get set }
    func viewDidLoad()
}
