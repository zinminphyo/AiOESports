//
//  GenderView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 26/11/2023.
//

import UIKit

class GenderView: UIControl, NibLoadable {
    
    @IBOutlet private(set) var maleSelectionImageView: UIImageView!
    @IBOutlet private(set) var intersexSelectionImageView: UIImageView!
    @IBOutlet private(set) var femaleSelectionImageView: UIImageView!
    
    private let selectedImage = UIImage(named: "selected")
    private let unselectedImage = UIImage(named: "unselected")
    
    private var _gender: Gender = .male {
        didSet {
            handleSelection()
        }
    }
    
    enum Gender: String {
        case male = "male"
        case intersex = "intersex"
        case female = "female"
        
        var title: String {
            switch self {
            case .male:
                return "Male"
            case .intersex:
                return "InterSex"
            case .female:
                return "Female"
            }
        }
    }
    
    @IBInspectable var gender: String {
        set { _gender = Gender(rawValue: newValue) ?? .male }
        get { _gender.title }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
    }
    
    @IBAction
    private func didTapMale(_ sender: UIButton) {
        _gender = .male
        sendActions(for: .valueChanged)
    }
    
    @IBAction
    private func didTapInterSex(_ sender: UIButton) {
        _gender = .intersex
        sendActions(for: .valueChanged)
    }
    
    @IBAction
    private func didTapFemale(_ sender: UIButton) {
        _gender = .female
        sendActions(for: .valueChanged)
    }
    
    private func handleSelection() {
        maleSelectionImageView.image = _gender == .male ? selectedImage : unselectedImage
        intersexSelectionImageView.image = _gender == .intersex ? selectedImage : unselectedImage
        femaleSelectionImageView.image = _gender == .female ? selectedImage : unselectedImage
    }
    

}
