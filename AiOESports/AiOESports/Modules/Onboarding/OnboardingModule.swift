//
//  OnboardingModule.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 21/03/2023.
//

import Foundation
import UIKit


enum OnboardingModule {
    static func createModule() -> Onboarding? {
        let stName = String(describing: Onboarding.self)
        let identifier = String(describing: Onboarding.self)
        let st = UIStoryboard(name: stName, bundle: .main)
        let vc = st.instantiateViewController(withIdentifier: identifier) as? Onboarding
        let vm = OnboardingViewModel()
        vc?.viewModel = vm
        vm.delegate = vc
        return vc
    }
}
