//
//  ProfileEditController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit
import Combine

class ProfileEditController: UIViewController {
    
    @IBOutlet private(set) var nameInputView: InputTextFieldView!
    @IBOutlet private(set) var phoneNumberInputView: InputTextFieldView!
    @IBOutlet private(set) var genderSelectionView: GenderView!
    @IBOutlet private(set) var birthdayDropdown: InputDropdownView!
    @IBOutlet private(set) var stateDropdown: InputDropdownView!
    @IBOutlet private(set) var cityDropdown: InputDropdownView!
    @IBOutlet private(set) var facebookLinkInputView: InputTextFieldView!
    @IBOutlet private(set) var instagramLinkInputView: InputTextFieldView!
    @IBOutlet private(set) var loadingView: LoadingView!
    
    private let viewModel: ProfileEditViewModel!
    
    private var subscription = Set<AnyCancellable>()
    
    init(info: ProfileInfoViewModel.ProfileInfo) {
        viewModel = ProfileEditViewModel(info: info)
        super.init(nibName: "ProfileEditController", bundle: nil)
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
        configureEndEditing()
        configureBirthdayDropdown()
        configureStateDropdown()
        configureCityDropdown()
        configureViewModel()
    }
    
    
    
    private func configureViewModel() {
        viewModel.$isUpdating
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                $0 ? self.loadingView.showLoading() : self.loadingView.hideLoading()
            }.store(in: &subscription)
        
        viewModel.profileEditCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.navigationController?.popViewController(animated: true)
            }.store(in: &subscription)
        
        nameInputView.value = viewModel.editInfo.username
        phoneNumberInputView.value = viewModel.editInfo.phoneNumber
        genderSelectionView.gender = viewModel.editInfo.gender
        birthdayDropdown.dropdownInfo = viewModel.editInfo.dateOfBirth
        stateDropdown.dropdownInfo = viewModel.editInfo.state
        cityDropdown.dropdownInfo = viewModel.editInfo.city
    }
    
    private func configureEndEditing() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTriggerTapGesture))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTriggerTapGesture() {
        view.endEditing(true)
    }
    
    private func configureBirthdayDropdown() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.preferredDatePickerStyle = .wheels
        birthdayDropdown.customInputView = datePicker
    }
    
    private func configureStateDropdown() {
        let rect = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: 200)
        let picker = AiOPickerView(frame: rect)
        picker.items = [
            "Yangon",
            "Mandalay",
            "Chin",
            "NayPyiTaw"
        ]
        stateDropdown.customInputView = picker
    }
    
    private func configureCityDropdown() {
        
    }
    

    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
   
    
    @IBAction
    private func didTapSave(_ sender: UIButton) {
        viewModel.updateProfile()
    }

    
    @IBAction
    private func didChangeTextForFacebookLink() {
        guard let fbLink = facebookLinkInputView.value else { return }
        viewModel.set(facebookLink: fbLink)
    }
}
