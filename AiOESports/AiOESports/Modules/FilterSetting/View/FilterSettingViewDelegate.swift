//
//  FilterSettingViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 07/04/2023.
//

import Foundation


protocol FilterSettingViewDelegate {
    var presenter: FilterSettingPresenting? { get set }
    func updateFilterSetting()
}
