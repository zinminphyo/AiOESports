//
//  AppInfoController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 28/11/2023.
//

import UIKit

class AppInfoController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction
    private func didTapDismiss(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction
    private func didTapLoginWithPhoneNumber(_ sender: UIButton) {
        guard let vc = LoginModule.createModule() else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapRegister(_ sender: UIButton) {
        guard let vc = RegisterModule.createModule() else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapPrivacyPolicy(_ sender: UIButton) {
        let vc = PrivacyPolicyController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapRateThisApp(_ sender: UIButton) {
        
    }
    
}
