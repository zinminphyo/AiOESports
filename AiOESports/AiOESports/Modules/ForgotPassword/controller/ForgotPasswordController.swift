//
//  ForgotPasswordController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import UIKit
import Combine

class ForgotPasswordController: UIViewController {
    
    @IBOutlet private(set) var phoneNumberLabel: UILabel!
    @IBOutlet private(set) var loadingView: LoadingView!
    
    private let viewModel: ForgotPasswordViewModel
    private(set) var subscription = Set<AnyCancellable>()
    
    init(profileModel: UserProfileResponseModel) {
        viewModel = ForgotPasswordViewModel(profile: profileModel)
        super.init(nibName: "ForgotPasswordController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support NSCoder")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureViewModel()
        
        phoneNumberLabel.text = "Get code from \(viewModel.profileModel.phone_no)"
    }
    
    private func configureViewModel() {
        
        viewModel.$isFetching
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                $0 ? self.loadingView.showLoading() : self.loadingView
                    .hideLoading()
            }.store(in: &subscription)
        
        viewModel.pinCodeServiceCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                let vc = VerifyPhoneNumberController(phoneNumber: viewModel.profileModel.phone_no, userId: String(viewModel.profileModel.id))
                navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscription)
    }
    
    
    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction
    private func didTapGetCode(_ sender: UIButton) {
        viewModel.requestPinCode()
    }
    
}
