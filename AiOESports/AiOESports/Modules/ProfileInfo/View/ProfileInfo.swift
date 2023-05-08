//
//  ProfileInfo.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 01/05/2023.
//

import UIKit

class ProfileInfo: UIViewController {
    
    struct City: AiOPickerDataPresenting {
        let name: String
        
        func getTitle() -> String {
            return name
        }
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genderTitleLabel: UILabel!
    @IBOutlet weak var genderCollectionView: UICollectionView!
    @IBOutlet weak var DOBTitleLabel: UILabel!
    @IBOutlet weak var dateOfBirthTxtField: UITextField!
    @IBOutlet weak var cityTitleLabel: UILabel!
    @IBOutlet weak var cityTxtField: UITextField!
    @IBOutlet weak var stateTitleLabel: UILabel!
    @IBOutlet weak var stateTxtField: UITextField!
    
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        formatter.dateFormat = "MMM dd YYYY"
        return formatter
    }()
    
    private let cityLists: [City] = [
        City(name: "Yangon"),
        City(name: "Mandalay"),
        City(name: "Bago"),
        City(name: "NayPyiTaw"),
        City(name: "Kachin"),
        City(name: "Kayah")
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    @IBAction func didTapDOBButton(_ sender: UIButton) {
        dateOfBirthTxtField.becomeFirstResponder()
        dateOfBirthTxtField.focusGroupPriority = .ignored
    }
    
    @IBAction func didTapCityButton() {
        cityTxtField.becomeFirstResponder()
    }
    
    private func configureHierarchy() {
        configureTitleLabel()
        configureGenderTitleLabel()
        configureGenderCollectionView()
        configureDOBTitleLabel()
        configureDateOfBirthTextField()
        configureCityTitleLabel()
        configureCityTextField()
        configureStateTitleLabel()
        configureStateTextField()
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Profile Info"
        titleLabel.font = Fonts.titleFont
        titleLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureGenderTitleLabel() {
        genderTitleLabel.text = "Gender"
        genderTitleLabel.font = Fonts.subtitleFont
        genderTitleLabel.textColor = Colors.Text.secondaryText
    }
    
    private func configureGenderCollectionView() {
        genderCollectionView.register(UINib(nibName: String(describing: SingleSelectionCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: SingleSelectionCollectionViewCell.reuseIdentifier)
        genderCollectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: 300, height: genderCollectionView.frame.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 20
        genderCollectionView.collectionViewLayout = flowLayout
        genderCollectionView.showsVerticalScrollIndicator = false
        genderCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureDOBTitleLabel() {
        DOBTitleLabel.text = "Date of birth"
        DOBTitleLabel.font = Fonts.subtitleFont
        DOBTitleLabel.textColor = Colors.Text.secondaryText
    }
    
    private func configureDateOfBirthTextField() {
        let datePicker = DatePicker(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
        datePicker.delegate = self
        dateOfBirthTxtField.inputView = datePicker
        dateOfBirthTxtField.tintColor = UIColor.clear
        let placeHolder = "Choose date of birth"
        let attributedPlaceHolder = NSMutableAttributedString(string: placeHolder)
        let range = NSRange(location: 0, length: placeHolder.count)
        attributedPlaceHolder.addAttribute(.foregroundColor, value: Colors.Text.secondaryText!, range: range)
        dateOfBirthTxtField.attributedPlaceholder = attributedPlaceHolder
        dateOfBirthTxtField.textColor = Colors.Text.primaryText
    }
    
    private func configureCityTitleLabel() {
        cityTitleLabel.text = "City"
        cityTitleLabel.font = Fonts.subtitleFont
        cityTitleLabel.textColor = Colors.Text.secondaryText
    }
    
    private func configureCityTextField() {
        let picker = AiOPicker(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
        picker.delegate = self
        picker.dataSource = self
        cityTxtField.inputView = picker
        cityTxtField.tintColor = UIColor.clear
        let placeHolder = "Choose State"
        let attributedPlaceHolder = NSMutableAttributedString(string: placeHolder)
        let range = NSRange(location: 0, length: placeHolder.count)
        attributedPlaceHolder.addAttribute(.foregroundColor, value: Colors.Text.secondaryText!, range: range)
        cityTxtField.attributedPlaceholder = attributedPlaceHolder
        cityTxtField.textColor = Colors.Text.primaryText
    }
    
    private func configureStateTitleLabel() {
        stateTitleLabel.text = "State"
        stateTitleLabel.font = Fonts.subtitleFont
        stateTitleLabel.textColor = Colors.Text.secondaryText
    }
    
    private func configureStateTextField() {
        
    }
    
    
    @objc func didTapDropDownBtn() {
        
    }


}


extension ProfileInfo: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleSelectionCollectionViewCell.reuseIdentifier, for: indexPath) as? SingleSelectionCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}


extension ProfileInfo: DatePickerDelegate {
    func didTapCancel() {
        dateOfBirthTxtField.resignFirstResponder()
    }
    func didTapSet(date: Date) {
        dateOfBirthTxtField.resignFirstResponder()
        dateOfBirthTxtField.text = dateFormatter.string(from: date)
    }
}



extension ProfileInfo: AiOPickerDelegate, AiOPickerDataSource {
    func didSelectItem(title: String) {
        cityTxtField.text = title
        cityTxtField.resignFirstResponder()
    }
    
    func numberOfItems() -> Int {
        return cityLists.count
    }
    
    func dataForIndex(at index: Int) -> AiOPickerDataPresenting {
        return cityLists[index]
    }
}
