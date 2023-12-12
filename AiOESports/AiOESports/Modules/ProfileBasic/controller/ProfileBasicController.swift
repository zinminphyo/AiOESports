//
//  ProfileBasicController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit
import Combine

class ProfileBasicController: UIViewController {
    
    @IBOutlet private(set) var profileLevelView: ProfileLevelView!
    @IBOutlet private(set) var usernameInfoView: ProfileInfoView!
    @IBOutlet private(set) var phoneNumberInfoView: ProfileInfoView!
    @IBOutlet private(set) var genderInfoView: ProfileInfoView!
    @IBOutlet private(set) var dobInfoView: ProfileInfoView!
    @IBOutlet private(set) var cityStateInfoView: ProfileInfoView!
    @IBOutlet private(set) var cityInfoView: ProfileInfoView!
    
    let viewModel: ProfileInfoViewModel
    
    private(set) var subscription = Set<AnyCancellable>()
    
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
        
        viewModel.userInfoFetchingCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.updateUserInfo($0)
            }.store(in: &subscription)
        /*
        profileLevelView.set(imageURL: viewModel.profileInfo.profileURL)
        usernameInfoView.value = viewModel.profileInfo.username
        phoneNumberInfoView.value = viewModel.profileInfo.phoneNumber
        genderInfoView.value = viewModel.profileInfo.gender
        dobInfoView.value = viewModel.profileInfo.dateOfBirth
        cityStateInfoView.value = viewModel.profileInfo.city
         */
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.fetchProfile()
    }
    
    private func updateUserInfo(_ userInfo: UserInfo) {
        profileLevelView.set(imageURL: userInfo.profile_image)
        profileLevelView.set(level: userInfo.level)
        usernameInfoView.value = userInfo.username
        phoneNumberInfoView.value = userInfo.phone_no
        genderInfoView.value = userInfo.gender
        dobInfoView.value = userInfo.dob
        cityStateInfoView.value = userInfo.state
        cityInfoView.value = userInfo.city
    }
    
    

}


extension ProfileBasicController {
    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction
    private func didTapEdit(_ sender: UIButton) {
        let vc = ProfileEditController(info: viewModel.profileInfo)
        navigationController?.pushViewController(vc, animated: true)
    }
}
