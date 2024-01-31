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
    
    func didFinishedFindingAccount(in view: FindYourAccountController) {
        print("Moved to OTP Code View.")
    }
}
