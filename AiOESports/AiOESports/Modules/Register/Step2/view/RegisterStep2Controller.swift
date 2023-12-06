//
//  RegisterStep2Controller.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 25/11/2023.
//

import UIKit
import Combine

class RegisterStep2Controller: UIViewController {
    
    private let viewModel: RegisterStep2ViewModel
    private(set) var subscription = Set<AnyCancellable>()
    
    @IBOutlet private(set) var phoneNumberLabel: UILabel!
    @IBOutlet private(set) var pinCodeView: PasscodeView!
    @IBOutlet private(set) var loadingView: LoadingView!
    
    
    init(phoneNumber: String) {
        viewModel = RegisterStep2ViewModel(phNum: phoneNumber)
        super.init(nibName: "RegisterStep2Controller", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configurePhoneNumberLabel()
        configureViewModel()
    }
    
    private func configurePhoneNumberLabel() {
        phoneNumberLabel.text = "Code is sent to \(viewModel.phoneNumber)"
        pinCodeView.delegate = self
    }
    
    private func configureViewModel() {
        
        viewModel.registrationStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                $0 == .inProgress ? self.loadingView.showLoading() : self.loadingView.hideLoading()
                guard $0 == .completed else { return }
                routeToInApp()
            }.store(in: &subscription)
    }
    
    private func routeToInApp() {
        guard let vc = InAppModule.createModule() else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction
    private func didTapVerify(_ sender: UIButton) {
        viewModel.registerStep2()
    }
}


extension RegisterStep2Controller: PasscodeViewDelegate {
    func didFinishedEnterPasscode(in view: PasscodeView, _ passcode: String) {
        viewModel.set(pincode: passcode)
    }
}
