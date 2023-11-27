//
//  ChangePasswordController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import UIKit
import Combine

class ChangePasswordController: UIViewController {
    
    @IBOutlet private(set) var newPasswordView: OTPView!
    @IBOutlet private(set) var reEnterPasswordView: OTPView!
    @IBOutlet private(set) var newPasswardErrorLabel: UILabel!
    @IBOutlet private(set) var reEnterPasswordErrorLabel: UILabel!
    @IBOutlet private(set) var loadingView: LoadingView!
    @IBOutlet private(set) var changeBtn: UIButton!
    
    private let viewModel: ChangePasswordViewModel!
    private(set) var subscription = Set<AnyCancellable>()
    
    init() {
        viewModel = ChangePasswordViewModel()
        super.init(nibName: "ChangePasswordController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support for this NSCoder.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureViewModel()
    }
    
    
    
    private func configureViewModel() {
        viewModel.$isNewPasswordMatched
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.newPasswardErrorLabel.isHidden = $0
                self.reEnterPasswordErrorLabel.isHidden = $0
            }.store(in: &subscription)
        
        viewModel.$isUpdating
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                $0 ? self.loadingView.showLoading() : self.loadingView.hideLoading()
            }.store(in: &subscription)
        
        viewModel.$isDataCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.changeBtn.isUserInteractionEnabled = $0
                self.changeBtn.backgroundColor = $0 ? Colors.Button.primaryColor : Colors.Button.secondaryColor
                self.changeBtn.setTitleColor($0 ? UIColor.white : UIColor.gray, for: .normal)
            }.store(in: &subscription)
    }
    
    
    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction
    private func didTapChange(_ sender: UIButton) {
        
    }
    
    @IBAction
    private func didChangeNewPasscode() {
        print("New Password is \(newPasswordView.text)")
        viewModel.set(newPassword: newPasswordView.text)
    }

    @IBAction
    private func didChangeReEnterNewPasscode() {
        print("ReEnter New Password is \(reEnterPasswordView.text)")
        viewModel.set(reEnterNewPassword: reEnterPasswordView.text)
    }
}
