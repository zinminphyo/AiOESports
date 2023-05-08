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
    
    struct State: AiOPickerDataPresenting {
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
    
    private var cityPicker: AiOPicker = {
        var picker = AiOPicker(frame: .zero)
        return picker
    }()
        
    
    private let cityLists: [City] = [
        City(name: "Yangon"),
        City(name: "Mandalay"),
        City(name: "Bago"),
        City(name: "NayPyiTaw"),
        City(name: "Kachin"),
        City(name: "Kayah")
    ]
    
    private let stateLists: [State] = [
        State(name: "Kachin"),
        State(name: "Kayah"),
        State(name: "Kayin"),
        State(name: "Chin"),
        State(name: "Yangon")
    ]
    
    private let genderLists: [String] = [
        "Male",
        "Intersex",
        "Female"
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
    
    @IBAction func didTapStateButton() {
        stateTxtField.becomeFirstResponder()
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
        genderCollectionView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: 300, height: genderCollectionView.frame.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 20
        genderCollectionView.collectionViewLayout = flowLayout
        genderCollectionView.showsVerticalScrollIndicator = false
        genderCollectionView.showsHorizontalScrollIndicator = false
        genderCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
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
        cityPicker.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 250)
        cityPicker.delegate = self
        cityPicker.dataSource = self
        cityTxtField.inputView = cityPicker
        cityTxtField.tintColor = UIColor.clear
        let placeHolder = "Choose City"
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
        let picker = AiOPicker(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 250))
        picker.delegate = self
        picker.dataSource = self
        stateTxtField.inputView = picker
        stateTxtField.tintColor = UIColor.clear
        let placeHolder = "Choose State"
        let attributedPlaceHolder = NSMutableAttributedString(string: placeHolder)
        let range = NSRange(location: 0, length: placeHolder.count)
        attributedPlaceHolder.addAttribute(.foregroundColor, value: Colors.Text.secondaryText!, range: range)
        stateTxtField.attributedPlaceholder = attributedPlaceHolder
        stateTxtField.textColor = Colors.Text.primaryText
    }
    
    
    @objc func didTapDropDownBtn() {
        
    }


}


extension ProfileInfo: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genderLists.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleSelectionCollectionViewCell.reuseIdentifier, for: indexPath) as? SingleSelectionCollectionViewCell else { return UICollectionViewCell() }
        cell.set(isSelected: collectionView.indexPathsForSelectedItems?.first == indexPath)
            .set(title: genderLists[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SingleSelectionCollectionViewCell else { return }
        cell.set(isSelected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? SingleSelectionCollectionViewCell else { return }
        cell.set(isSelected: false)
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
    func didSelectItem(title: String, picker: AiOPicker) {
        if picker == cityPicker {
            cityTxtField.text = title
            cityTxtField.resignFirstResponder()
        } else {
            stateTxtField.text = title
            stateTxtField.resignFirstResponder()
        }
        
    }
    
    func numberOfItems(picker: AiOPicker) -> Int {
        if picker == cityPicker {
            return cityLists.count
        }
        return stateLists.count
    }
    
    func dataForIndex(at index: Int, picker: AiOPicker) -> AiOPickerDataPresenting {
        if picker == cityPicker {
            return cityLists[index]
        }
        return stateLists[index]
    }
}
