//
//  FindYourAccountController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 01/02/2024.
//

import UIKit
import Combine

protocol FindYourAccountControllerDelegate: AnyObject {
    func didFinishedFindingAccount(in view: FindYourAccountController)
    func didCancelFindingAccount(in view: FindYourAccountController)
}

class FindYourAccountController: UIViewController {
    
    weak var delegate: FindYourAccountControllerDelegate?
    @IBOutlet private(set) var phoneNumberView: PhoneNumberView!
    @IBOutlet private(set) var searchBtn: UIButton!
    @IBOutlet private(set) var loadingView: UIView!
    private let vm: FindYourAccountViewModel!
    private(set) var subscription = Set<AnyCancellable>()
    
    init() {
        vm = FindYourAccountViewModel()
        super.init(nibName: "FindYourAccountController", bundle: nil)
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
        
        phoneNumberView.delegate = self
    }
    
    private func configureViewModel() {
        vm.$phoneNumberIsCorrect
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                self?.updateSearchBtn($0)
            })
            .store(in: &subscription)
        
        vm.findingStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                switch $0 {
                case .inProgress:
                    self.loadingView.isHidden = false
                case .success:
                    self.loadingView.isHidden = true
                    self.delegate?.didFinishedFindingAccount(in: self)
                case .failed(let error):
                    self.loadingView.isHidden = true
                    print("Error is \(error)")
                }
            }.store(in: &subscription)
    }
    
    private func updateSearchBtn(_ isEnabled: Bool) {
        searchBtn.isUserInteractionEnabled = isEnabled
        searchBtn.setTitleColor(isEnabled ? Colors.Text.primaryText : Colors.Text.secondaryText, for: .normal)
        searchBtn.backgroundColor = isEnabled ? Colors.Theme.inputColor : Colors.Theme.SecondaryBackground
    }
    

    @IBAction
    private func didTapBack(_ sender: UIButton) {
        delegate?.didCancelFindingAccount(in: self)
    }
    
    @IBAction
    private func didTapSearch(_ sender: UIButton) {
        vm.search()
    }

}


extension FindYourAccountController: PhoneNumberViewDelegate {
    func didChangePhoneNumber(phoneNum: String) {
        vm.phoneNumberIsCorrect = !phoneNum.isEmpty
    }
}
