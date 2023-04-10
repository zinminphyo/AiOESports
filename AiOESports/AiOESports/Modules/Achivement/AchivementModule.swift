//
//  AchivementModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import Foundation
import UIKit

enum AchivementModule {
    static func createModule(achivementLists: [AchivementModel]) -> Achivement? {
        let st = UIStoryboard(name: "Achivement", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Achivement.self)) as? Achivement else { return nil }
        let presenter = AchivementPresenter()
        presenter.set(achivementLists: achivementLists)
        presenter.viewDelegate = vc
        vc.presenter = presenter
        return vc
    }
}
