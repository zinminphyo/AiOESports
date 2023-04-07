//
//  FilterSettingModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation
import UIKit


enum FilterSettingModule {
    static func createModule(category: RankCategory, delegate: FilterSettingDelegate) -> FilterSetting? {
        let st = UIStoryboard(name: "FilterSetting", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: FilterSetting.self)) as? FilterSetting else {
            return nil
        }
        let presenter = FilterSettingPresenter()
        presenter.set(category: category)
        presenter.viewDelegate = vc
        vc.presenter = presenter
        vc.delegate = delegate
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        vc.hidesBottomBarWhenPushed = true
        return vc
    }
}
