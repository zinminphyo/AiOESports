//
//  FilterSettingModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation
import UIKit


enum FilterSettingModule {
    static func createModule() -> FilterSetting? {
        let st = UIStoryboard(name: "FilterSetting", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: FilterSetting.self)) as? FilterSetting else {
            return nil
        }
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        return vc
    }
}
