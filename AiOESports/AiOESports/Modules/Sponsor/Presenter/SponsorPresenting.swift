//
//  SponsorPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


protocol SponsorPresenting {
    var viewDelegate: SponsorViewDelegate? { get set }
    func viewDidLoad()
}
