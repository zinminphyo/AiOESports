//
//  ProfileEditController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class ProfileEditController: UIViewController {
    
    @IBOutlet private(set) var birthdayDropdown: InputDropdownView!
    @IBOutlet private(set) var stateDropdown: InputDropdownView!
    @IBOutlet private(set) var cityDropdown: InputDropdownView!

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
        
    }

}
