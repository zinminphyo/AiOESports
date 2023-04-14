//
//  CareerPresentin.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation


protocol CareerPresenting {
    var viewDelegate: CareerViewDelegate? { get set }
    func viewDidLoad()
}
