//
//  SponsorViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


protocol SponsorViewDelegate {
    var presenter: SponsorPresenting? { get set }
    func updateUI(sponsorLists: [SponsorModel])
}
