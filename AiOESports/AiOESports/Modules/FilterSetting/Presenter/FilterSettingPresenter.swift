//
//  FilterSettingPresenter.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 07/04/2023.
//

import Foundation


class FilterSettingPresenter: FilterSettingPresenting {
    
    var viewDelegate: FilterSettingViewDelegate?
    
    private var category: RankCategory = .team
    
    func set(category: RankCategory) {
        self.category = category
//        self.viewDelegate?.updateFilterSetting()
    }
    
    func getSettingCount() -> Int {
        switch category {
        case .team:
            return TeamFilterStatus.allCases.count
        case .player:
            return PlayerFilterStatus.allCases.count
        case .caster:
            return TeamFilterStatus.allCases.count
        case .creator:
            return TeamFilterStatus.allCases.count
        }
    }
    
    func getSettingTitle(index: Int) -> String {
        switch category {
        case .team:
            return TeamFilterStatus.allCases[index].title
        case .player:
            return PlayerFilterStatus.allCases[index].title
        case .caster:
            return TeamFilterStatus.allCases[index].title
        case .creator:
            return TeamFilterStatus.allCases[index].title
        }
    }
    
    func getSettingValue(index: Int) -> String {
        switch category {
        case .team:
            return TeamFilterStatus.allCases[index].value
        case .player:
            return PlayerFilterStatus.allCases[index].value
        case .caster:
            return TeamFilterStatus.allCases[index].value
        case .creator:
            return TeamFilterStatus.allCases[index].value
        }
    }
    
    
}
