//
//  ProfileController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 21/11/2023.
//

import UIKit

class ProfileController: UIViewController {
    
    private let viewModel: ProfileViewModel

    init() {
        viewModel = ProfileViewModel()
        super.init(nibName: "ProfileController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support for NSCoder.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}


// MARK: - Actions
extension ProfileController {
    @IBAction
    private func didTapDismissBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction
    private func didTapProfileInfo(_ sender: UIButton) {
        let vc = ProfileBasicController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapGameSorting(_ sender: UIButton) {
        
    }
    
    @IBAction
    private func didTapFollowAndVote(_ sender: UIButton) {
        
    }
    
    @IBAction
    private func didTapShieldsHistory(_ sender: UIButton) {
        
    }
    
    @IBAction
    private func didTapPasscode(_ sender: UIButton) {
        
    }
    
    @IBAction
    private func didTapPrivacyPolicy(_ sender: UIButton) {
        
    }
    
    @IBAction
    private func didTapRateThisApp(_ sender: UIButton) {
        
    }
    
    @IBAction
    private func didTapLogout(_ sender: UIButton) {
        
    }
}
 
