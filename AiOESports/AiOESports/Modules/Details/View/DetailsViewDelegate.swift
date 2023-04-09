//
//  DetailsViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 09/04/2023.
//

import Foundation


protocol DetailsViewDelegate {
    var presenter: DetailsPresenting? { get set }
    func renderDetails(details: TeamDetails)
}
