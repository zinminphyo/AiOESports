//
//  PasscodeController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class PasscodeController: UIViewController {
    
    private let userProfileModel: UserProfileResponseModel
    
    init(profile: UserProfileResponseModel) {
        userProfileModel = profile
        super.init(nibName: "PasscodeController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support NSCoder.")
    }

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
        let vc = ChangePasswordController(userId: String(userProfileModel.id))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapForgotPassword(_ sender: UIButton) {
        let vc = ForgotPasswordController(profileModel: userProfileModel)
        navigationController?.pushViewController(vc, animated: true)
    }

}
