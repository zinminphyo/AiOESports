//
//  DetailsPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/04/2023.
//

import Foundation


protocol DetailsPresenting {
    var viewDelegate: DetailsViewDelegate? { get set }
    func fetchDetails()
}
