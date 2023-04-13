//
//  PlayerOverviewPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import Foundation


protocol PlayerOverviewPresenting {
    var viewDelegate: PlayerOverviewViewDelegate? { get set }
    func viewDidLoad()
}
