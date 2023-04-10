//
//  FormerPlayersPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


protocol FormerPlayersPresenting {
    var viewDelegate: FormerPlayersViewDelegate? { get set }
    func viewDidLoad()
}
