//
//  PasscodeController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class PasscodeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    

    @IBAction
    private func didTapChangePassword(_ sender: UIButton) {
        let vc = ChangePasswordController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapForgotPassword(_ sender: UIButton) {
        
    }

}
