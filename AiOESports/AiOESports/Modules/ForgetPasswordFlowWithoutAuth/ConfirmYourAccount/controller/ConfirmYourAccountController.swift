//
//  ConfirmYourAccountController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/02/2024.
//

import UIKit
import Combine


protocol ConfirmYourAccountControllerDelegate: AnyObject {
//    func didTapNotNow(in controller: ConfirmYourAccountController)
    func didFinishedStep1Reset(in controller: ConfirmYourAccountController)
}

class ConfirmYourAccountController: UIViewController {
    
    @IBOutlet private(set) var profileImageView: ProfileLevelView!
    @IBOutlet private(set) var nameLabel: UILabel!
    @IBOutlet private(set) var phoneNumberLabel: UILabel!
    
    private let vm: ConfirmYourAccountViewModel!
    private(set) var subscription = Set<AnyCancellable>()
    
    weak var delegate: ConfirmYourAccountControllerDelegate?
    
    init(confirmInfo: ConfirmYourAccountViewModel.ConfirmYourAccount) {
        vm = ConfirmYourAccountViewModel(confirmAccountInfo: confirmInfo)
        super.init(nibName: "ConfirmYourAccountController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support for this NSCoder.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureViewModel()
    }
    
    private func configureViewModel() {
        profileImageView.set(imageURL: vm.confirmAccountInfo.profileURL)
        profileImageView.set(level: vm.confirmAccountInfo.level)
        nameLabel.text = vm.confirmAccountInfo.name
        phoneNumberLabel.text = String(format: "Get Code from %@", vm.confirmAccountInfo.phoneNumber)
        
        vm.didCompleteStep1
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.goToStep2()
            }.store(in: &subscription)
    }
  
    private func goToStep2() {
        let vc = VerifyPhoneNumberController(phoneNumber: vm.confirmAccountInfo.phoneNumber, userId: "")
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction
    private func didTapNotyou(_ sender: UIButton) {
        
    }
    
    @IBAction
    private func didTapContinueBtn(_ sender: UIButton) {
        vm.forgotStep1()
    }

}
