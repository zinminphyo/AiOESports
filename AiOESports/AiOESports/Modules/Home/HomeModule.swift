//
//  HomeModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/04/2023.
//

import Foundation
import UIKit


enum HomeModule {
    static func createModule() -> Home? {
        let st = UIStoryboard(name: "Home", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: Home.self)) as? Home else {
            return nil
        }
        vc.tabBarItem.image = Images.InAppImages.home_unselected
        vc.tabBarItem.title = "HOME"
        vc.tabBarItem.setTitleTextAttributes([.foregroundColor : Colors.TabItem.home], for: .normal)
        vc.tabBarItem.selectedImage = Images.InAppImages.home_selected
        
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        presenter.viewDelegate = vc
        presenter.interactor = interactor
        interactor.presenterDelegate = presenter
        vc.presenter = presenter
        return vc
    }
}
