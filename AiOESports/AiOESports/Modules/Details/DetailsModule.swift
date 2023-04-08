//
//  DetailsModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import Foundation
import UIKit


enum DetailsModuel {
    static func createModule() -> Details? {
        let st = UIStoryboard(name: "Details", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Details.self)) as? Details else { return nil }
        vc.hidesBottomBarWhenPushed = true
        return vc
    }
}
