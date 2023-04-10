//
//  AchivementPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import Foundation


class AchivementPresenter: AchivementPresenting {
        
    var viewDelegate: AchivementViewDelegate?
    private var achivements: [AchivementModel] = []
    
    func viewDidLoad() {
        self.viewDelegate?.updateUI(achivement: self.achivements)
    }
    
    func set(achivementLists: [AchivementModel]) {
        self.achivements = achivementLists
    }
    
}
