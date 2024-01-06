//
//  ProfileEditController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit
import Combine

class ProfileEditController: UIViewController {
    
    @IBOutlet private(set) var profileFrameView: ProfileLevelView!
    @IBOutlet private(set) var nameInputView: InputTextFieldView!
    @IBOutlet private(set) var phoneNumberInputView: InputTextFieldView!
    @IBOutlet private(set) var genderSelectionView: GenderView!
    @IBOutlet private(set) var birthdayDropdown: InputDropdownView!
    @IBOutlet private(set) var stateDropdown: InputDropdownView!
    @IBOutlet private(set) var cityDropdown: InputDropdownView!
    @IBOutlet private(set) var facebookLinkInputView: InputTextFieldView!
    @IBOutlet private(set) var instagramLinkInputView: InputTextFieldView!
    @IBOutlet private(set) var loadingView: LoadingView!
    
    private let statePicker = AiOPickerView()
    private let cityPicker = AiOPickerView()
    
    private let viewModel: ProfileEditViewModel!
    
    private var subscription = Set<AnyCancellable>()
    
    lazy var viewRenderDateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    lazy var apiRequestDateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    
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
        
        viewModel.$regions
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.statePicker.items = $0.compactMap{ $0.nameEN }
            }.store(in: &subscription)
        
        viewModel.$cities
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.cityPicker.items = $0.compactMap{ $0.nameEN }
            }.store(in: &subscription)
         
        
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
        
        viewModel.userInfoFetchingCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.updateUI(userInfo: $0)
            }.store(in: &subscription)
        
        viewModel.$currentStateName
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.stateDropdown.dropdownInfo = $0
            }.store(in: &subscription)
        
        viewModel.$currentCityName
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else {return }
                self.cityDropdown.dropdownInfo = $0
            }.store(in: &subscription)
        /*
        profileFrameView.set(level: viewModel.editInfo.level)
        profileFrameView.set(imageURL: viewModel.editInfo.profileURL)
        nameInputView.value = viewModel.editInfo.username
        phoneNumberInputView.value = viewModel.editInfo.phoneNumber
        genderSelectionView.gender = viewModel.editInfo.gender.lowercased()
        birthdayDropdown.dropdownInfo = viewModel.editInfo.dateOfBirth
        stateDropdown.dropdownInfo = viewModel.editInfo.state
        cityDropdown.dropdownInfo = viewModel.editInfo.city
        facebookLinkInputView.value = viewModel.editInfo.facebook
        instagramLinkInputView.value = viewModel.editInfo.instagram
        */
        viewModel.fetchProfile()
        viewModel.fetchStateLists()
    }
    
    private func updateUI(userInfo: UserInfo) {
        profileFrameView.set(level: userInfo.level)
        profileFrameView.set(imageURL: userInfo.profile_image)
        nameInputView.value = userInfo.username
        phoneNumberInputView.value = userInfo.phone_no
        genderSelectionView.gender = userInfo.gender.lowercased()
        birthdayDropdown.dropdownInfo = userInfo.dob
        stateDropdown.dropdownInfo = userInfo.state
        cityDropdown.dropdownInfo = userInfo.city
        facebookLinkInputView.value = userInfo.facebook_link
        instagramLinkInputView.value = userInfo.instagram_link
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
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.addTarget(self, action: #selector(didChangeBOD(_:)), for: .valueChanged)
        birthdayDropdown.customInputView = datePicker
    }
    
    @objc func didChangeBOD(_ datePicker: UIDatePicker) {
        birthdayDropdown.dropdownInfo = viewRenderDateFormatter.string(from: datePicker.date)
        viewModel.set(dob: apiRequestDateFormatter.string(from: datePicker.date))
    }
    
    private func configureStateDropdown() {
        let rect = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: 250)
        statePicker.frame = rect
        statePicker.delegate = self
        stateDropdown.customInputView = statePicker
    }
    
    private func configureCityDropdown() {
        let rect = CGRect(x: 0.0, y: 0.0, width: view.bounds.width, height: 250)
        cityPicker.frame = rect
        cityPicker.delegate = self
        cityDropdown.customInputView = cityPicker
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
    private func didChangeGender(_ sender: GenderView) {
        viewModel.set(gender: sender.gender)
    }
    
    @IBAction
    private func didTapChangeProfile(_ sender: UIButton) {
        presentImagePicker()
    }
    
    @IBAction
    private func didTapStateDropdown(_ sender: InputDropdownView) {
        statePicker.items
    }
    
    @IBAction
    private func didTapCityDropdown(_ sender: InputDropdownView) {
        
    }
    
    private func presentImagePicker() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    
    @IBAction
    private func didChangeTextForFacebookLink() {
        guard let fbLink = facebookLinkInputView.value else { return }
        viewModel.set(facebookLink: fbLink)
    }
    
    @IBAction
    private func didChangeInstagramLinkInput() {
        guard let instagramLink = instagramLinkInputView.value else { return }
        viewModel.set(instagramLink: instagramLink)
    }
    
    @IBAction
    private func didChangeUserNameInput() {
        guard let username = nameInputView.value else { return }
        viewModel.set(username: username)
    }
    
    @IBAction
    private func didChangePhoneNumberInput() {
        guard let phone = phoneNumberInputView.value else { return }
        viewModel.set(phoneNumber: phone)
    }

}


extension ProfileEditController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        profileFrameView.set(image: image)
        viewModel.set(image: image)
        picker.dismiss(animated: true)
    }
}



extension ProfileEditController: AiOPickerViewDelegate {
    func didSelectItem(in view: AiOPickerView, for value: String) {
        switch view {
        case statePicker:
            viewModel.set(state: value)
        case cityPicker: 
            viewModel.set(city: value)
        default:
            break
        }
    }
}



