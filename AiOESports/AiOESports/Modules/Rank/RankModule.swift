//
//  RankModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import Foundation
import UIKit


enum RankModule {
    static func createModule() -> Rank? {
        let st = UIStoryboard(name: "Rank", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Rank.self)) as? Rank else {
            return nil
        }
        return vc
    }
}
