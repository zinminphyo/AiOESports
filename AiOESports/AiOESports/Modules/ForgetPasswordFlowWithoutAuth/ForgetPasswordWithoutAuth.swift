//
//  ForgetPasswordWithoutAuth.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 01/02/2024.
//

import UIKit

class ForgetPasswordWithoutAuth: UIViewController {
    
    private var navigation: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        embedNav()
    }
    
    
    private func embedNav() {
        let vc = FindYourAccountController()
        vc.delegate = self
        navigation = UINavigationController(rootViewController: vc)
        navigation.navigationBar.isHidden = true
        addChild(navigation)
        navigation.willMove(toParent: self)
        view.addSubview(navigation.view)
        navigation.didMove(toParent: self)
    }

    

}

extension ForgetPasswordWithoutAuth: FindYourAccountControllerDelegate {
    func didCancelFindingAccount(in view: FindYourAccountController) {
        navigationController?.popViewController(animated: true)
    }
    
    func didFinishedFindingAccount(in view: FindYourAccountController, for profile: FindYourAccountResponse, phone: String) {
        let vc = ConfirmYourAccountController(
            confirmInfo: .init(
                name: profile.username,
                profileURL: profile.profile_image,
                badge: profile.badge,
                level: profile.level,
                phoneNumber: phone
            )
        )
        vc.delegate = self
        navigation.pushViewController(vc, animated: true)
    }
}



extension ForgetPasswordWithoutAuth: ConfirmYourAccountControllerDelegate {
    func didFinishedStep1Reset(in controller: ConfirmYourAccountController, phoneNumber: String) {
        let vc = VerifyPhoneNumberController(phoneNumber: phoneNumber, userId: "")
        vc.delegte = self
        navigation?.pushViewController(vc, animated: true)
    }
}


extension ForgetPasswordWithoutAuth: VerifyPhoneNumberControllerDelegate {
    func didFinishedPhoneNumberConfirm(in controller: VerifyPhoneNumberController, for phoneNumber: String) {
        let vc = ChangePasswordController(phoneNumber: phoneNumber)
        vc.delegate = self
        navigation.pushViewController(vc, animated: true)
    }
}

extension ForgetPasswordWithoutAuth: ChangePasswordControllerDelegate {
    func didFinishedChangePassword(in controller: ChangePasswordController) {
        navigationController?.popViewController(animated: true)
    }
}
