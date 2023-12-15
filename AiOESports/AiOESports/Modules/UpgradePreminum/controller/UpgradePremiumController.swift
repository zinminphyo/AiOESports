//
//  UpgradePremiumController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 28/11/2023.
//

import UIKit
import Combine

class UpgradePremiumController: UIViewController {
    
    @IBOutlet private(set) var pincodeView: OTPView!
    @IBOutlet private(set) var shieldAmountLabel: UILabel!
    @IBOutlet private(set) var loadingView: LoadingView!
    @IBOutlet private(set) var continueBtn: UIButton!
    @IBOutlet private(set) var errorLabel: UILabel!
    @IBOutlet private(set) var payWithCoinContainerView: UIView!
    
    private let viewModel: UpgradePreminumViewModel!
    
    private(set) var subscription = Set<AnyCancellable>()
    
    override var transitioningDelegate: UIViewControllerTransitioningDelegate? {
        get { self } set {}
    }
    
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { .custom } set {}
    }
    
    init(shieldCount: Int) {
        viewModel = UpgradePreminumViewModel(shieldCount: shieldCount)
        super.init(nibName: "UpgradePremiumController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support for this NSCoder.")
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        shieldAmountLabel.text = String(viewModel.shieldCount)
    }
    

    private func configureHierarchy() {
        configureViewModel()
        configureKeyboardNotification()
        configureDismissGesture()
    }
    
    private func configureViewModel() {
        viewModel.$isUpgrading
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                $0 ? self.loadingView.showLoading() : self.loadingView.hideLoading()
            }.store(in: &subscription)
        
        viewModel.$isPasscodeEntered
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.continueBtn.isUserInteractionEnabled = $0
                self.payWithCoinContainerView.backgroundColor = $0 ? Colors.Button.primaryColor : Colors.Button.primaryColor?.withAlphaComponent(0.5)
            }.store(in: &subscription)
        
        viewModel.upgradeStatusCompletion
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                switch $0 {
                case .success:
                    self.errorLabel.isHidden = true
                    self.dismiss(animated: true)
                case .failed(let error):
                    self.errorLabel.isHidden = false
                    self.errorLabel.text = error
                }
            }.store(in: &subscription)
    }
    
    private func configureKeyboardNotification() {
        /*
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .receive(on: DispatchQueue.main)
            .map{ ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.size.height }
            .sink { [weak self] keyboardHeight in
                guard let self = self else { return }
                guard let height = keyboardHeight else { return }
                self.continueButtonBottomConstraint.constant = height + 24.0
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }.store(in: &subscription)
        
        
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.continueButtonBottomConstraint.constant = 24
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            }.store(in: &subscription)
        */
        
    }
    
    private func configureDismissGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTriggerTapGesture))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTriggerTapGesture() {
        dismiss(animated: true)
    }
    
    @IBAction
    private func didTapContinue(_ sender: UIButton) {
        viewModel.upgrade()
    }
    
    @IBAction
    private func didCompletedPinCode(_ sender: OTPView) {
        viewModel.set(pin: sender.text)
    }

}


extension UpgradePremiumController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingBackgroundPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
