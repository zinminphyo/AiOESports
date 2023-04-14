//
//  CareerPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation


class CareerPresenter: CareerPresenting {
    
    var viewDelegate: CareerViewDelegate?
    
    private var careerLists: [CareerModel] = []
    
    init(careerLists: [CareerModel]) {
        self.careerLists = careerLists
    }
    
    func viewDidLoad() {
        self.viewDelegate?.renderCareerLists(lists: self.careerLists)
    }
    
    
}
