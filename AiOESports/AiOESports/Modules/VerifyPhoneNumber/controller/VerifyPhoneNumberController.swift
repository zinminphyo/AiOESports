//
//  VerifyPhoneNumberController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import UIKit
import Combine

class VerifyPhoneNumberController: UIViewController {
    
    @IBOutlet private(set) var loadingView: LoadingView!
    @IBOutlet private(set) var verifyButton: UIButton!
    @IBOutlet private(set) var pinCodeView: OTPView!
    
    private let viewModel: VerifyPhoneNumberViewModel
    private(set) var subscription = Set<AnyCancellable>()
    
    init(phoneNumber: String, userId: String) {
        viewModel = VerifyPhoneNumberViewModel(phoneNum: phoneNumber, userID: userId)
        super.init(nibName: "VerifyPhoneNumberController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support for this NSCoder")
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
            .sink { [weak self] in
                guard let self = self else { return }
                $0 ? self.loadingView.showLoading() : self.loadingView.hideLoading()
            }.store(in: &subscription)
        
        viewModel.isVerifyPINCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                let vc = ChangePasswordController(userId: viewModel.userId)
                self.navigationController?.pushViewController(vc, animated: true)
            }.store(in: &subscription)
        
        viewModel.$verifyIsEnabled
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  in
                guard let self = self else { return }
                self.verifyButton.isUserInteractionEnabled = $0
            }.store(in: &subscription)
        
        viewModel.$verifyIsEnabled
            .receive(on: DispatchQueue.main)
            .map{ $0 ? Colors.Button.primaryColor : Colors.Button.secondaryColor }
            .sink { [weak self] in
                guard let self = self else { return }
                self.verifyButton.backgroundColor = $0
            }.store(in: &subscription)
        
        viewModel.$verifyIsEnabled
            .receive(on: DispatchQueue.main)
            .map{ $0 ? UIColor.white : UIColor.tertiarySystemFill }
            .sink { [weak self] in
                guard let self = self else { return }
                self.verifyButton.setTitleColor($0, for: .normal)
            }.store(in: &subscription)
        
        
    }

    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction
    private func didTapVerify(_ sender: UIButton) {
        viewModel.verifyPIN()
    }
    
    @IBAction
    private func didTapRequestAgain(_ sender: UIButton) {
        
    }
    
    @IBAction
    private func didChangePinCode(_ sender: OTPView) {
        viewModel.set(pincode: sender.text)
    }
    
}
