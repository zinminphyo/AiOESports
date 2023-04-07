//
//  FilterSettingPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 07/04/2023.
//

import Foundation


protocol FilterSettingPresenting {
    var viewDelegate: FilterSettingViewDelegate? { get set }
    func set(category: RankCategory)
    func getSettingCount() -> Int
    func getSettingTitle(index: Int) -> String
}
