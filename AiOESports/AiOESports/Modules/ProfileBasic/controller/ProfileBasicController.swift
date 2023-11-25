//
//  ProfileBasicController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class ProfileBasicController: UIViewController {
    
    @IBOutlet private(set) var profileLevelView: ProfileLevelView!
    @IBOutlet private(set) var usernameInfoView: ProfileInfoView!
    @IBOutlet private(set) var phoneNumberInfoView: ProfileInfoView!
    @IBOutlet private(set) var genderInfoView: ProfileInfoView!
    @IBOutlet private(set) var dobInfoView: ProfileInfoView!
    @IBOutlet private(set) var cityStateInfoView: ProfileInfoView!
    
    let viewModel: ProfileInfoViewModel
    
    init(info: ProfileInfoViewModel.ProfileInfo) {
        viewModel = ProfileInfoViewModel(info: info)
        super.init(nibName: "ProfileBasicController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileLevelView.set(imageURL: viewModel.profileInfo.profileURL)
        usernameInfoView.value = viewModel.profileInfo.username
        phoneNumberInfoView.value = viewModel.profileInfo.phoneNumber
        genderInfoView.value = viewModel.profileInfo.gender
        dobInfoView.value = viewModel.profileInfo.dateOfBirth
        cityStateInfoView.value = viewModel.profileInfo.city
    }
    
    
    

}


extension ProfileBasicController {
    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction
    private func didTapEdit(_ sender: UIButton) {
        let vc = ProfileEditController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
