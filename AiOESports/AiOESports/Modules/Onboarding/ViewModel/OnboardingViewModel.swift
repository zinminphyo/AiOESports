//
//  OnboardingViewModel.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/03/2023.
//

import Foundation



class OnboardingViewModel {
    
    var delegate: OnboardingViewProtocol?
    
    private(set) var totalPages: Int = 3
    
    func set(currentPage: Int) {
        delegate?.didReachedLastPage(isReached: currentPage == totalPages)
    }
    
}
