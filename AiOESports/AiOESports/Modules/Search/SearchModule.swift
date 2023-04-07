//
//  SearchModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation
import UIKit

enum SearchModule {
    static func createModule() -> Search? {
        let st = UIStoryboard(name: "Search", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Search.self)) as? Search else { return nil }
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        
        presenter.viewDelegate = vc
        presenter.interactor = interactor
        
        interactor.presenterDelegate = presenter
        
        vc.presenter = presenter
        
        vc.hidesBottomBarWhenPushed = true
        
        return vc
    }
}
