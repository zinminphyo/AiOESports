//
//  CareerModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import Foundation
import UIKit


enum CareerModule {
    static func createModule(careerLists: [CareerModel]) -> Career? {
        let st = UIStoryboard(name: "Career", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Career.self)) as? Career else { return nil }
        let presenter = CareerPresenter(careerLists: careerLists)
        presenter.viewDelegate = vc
        vc.presenter = presenter
        return vc
    }
}
