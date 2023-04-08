//
//  SquadModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import Foundation
import UIKit

enum SquadModule {
    static func createModule() -> Squad? {
        let st = UIStoryboard(name: "Squad", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Squad.self)) as? Squad else { return nil }
        return vc
    }
}
