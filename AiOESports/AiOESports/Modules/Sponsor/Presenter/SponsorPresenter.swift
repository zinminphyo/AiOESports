//
//  SponsorPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


class SponsorPresenter: SponsorPresenting {
    
    var viewDelegate: SponsorViewDelegate?
    
    private var sponsorLists: [SponsorModel] = []
    
    func viewDidLoad() {
        self.viewDelegate?.updateUI(sponsorLists: sponsorLists)
    }
    
    func set(sponsorLists: [SponsorModel]) {
        self.sponsorLists = sponsorLists
    }
    
}
