//
//  ProfileController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 21/11/2023.
//

import UIKit
import Combine
import Kingfisher

class ProfileController: UIViewController {
    
    @IBOutlet private(set) var loadingView: LoadingView!
    @IBOutlet private(set) var nameLabel: UILabel!
    @IBOutlet private(set) var idLabel: UILabel!
    @IBOutlet private(set) var profileLevelView: ProfileLevelView!
    
    private let viewModel: ProfileViewModel
    private(set) var subscription = Set<AnyCancellable>()

    init() {
        viewModel = ProfileViewModel()
        super.init(nibName: "ProfileController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support for NSCoder.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureViewModel()
    }
    
    private func configureViewModel() {
        
        viewModel.$isFetching
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  in
                guard let self = self else { return }
                profileLevelView.isLoading = $0
                $0 ? self.loadingView.showLoading() : self.loadingView.hideLoading()
            }.store(in: &subscription)
        
        viewModel.profileFetchingCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else {return}
                self.UIBinding()
            }.store(in: &subscription)
        
        viewModel.fetchUserProfile()
    }
    
    private func UIBinding() {
        nameLabel.text = viewModel.profileModel.username
        idLabel.text = "id-\(viewModel.profileModel.id)"
        profileLevelView.set(imageURL: viewModel.profileModel.profile_image)
    }

}


// MARK: - Actions
extension ProfileController {
    
    @IBAction
    private func didTapUpgradePremium(_ sender: UIButton) {
        print("Did tap upgrade premium.")
    }
    
    @IBAction
    private func didTapDismissBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction
    private func didTapProfileInfo(_ sender: UIButton) {
        let profileModel = viewModel.profileModel
        let info = ProfileInfoViewModel.ProfileInfo(profileURL: profileModel.profile_image, username: profileModel.username, phoneNumber: profileModel.phone_no, gender: profileModel.gender, dateOfBirth: profileModel.dob, city: profileModel.city)
        let vc = ProfileBasicController(info: info)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapGameSorting(_ sender: UIButton) {
        let vc = GameSortingController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapFollowAndVote(_ sender: UIButton) {
        let vc = FollowAndVoteController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapShieldsHistory(_ sender: UIButton) {
        
    }
    
    @IBAction
    private func didTapPasscode(_ sender: UIButton) {
        let vc = PasscodeController()
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
    
    @IBAction
    private func didTapLogout(_ sender: UIButton) {
        
    }
}
 
