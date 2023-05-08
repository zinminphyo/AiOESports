//
//  AiOPicker.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 05/05/2023.
//

import UIKit

class AiOPicker: UIView, NibLoadable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var actionButton: UIButton!
    
    var delegate: AiOPickerDelegate? = nil
    var dataSource: AiOPickerDataSource? = nil
    
    private var selectedIndex: Int = 0
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
        configureHierarchy()
    }

    private func configureHierarchy() {
        configureBackgroundColor()
        configureTitleLabel()
        configurePickerView()
        configureActionButton()
    }
    
    private func configureBackgroundColor() {
        self.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Choose state"
        titleLabel.font = Fonts.titleFont
        titleLabel.textColor = Colors.Text.primaryText
    }
    
    private func configurePickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.setValue(Colors.Text.primaryText ?? UIColor.white, forKey: "textColor")
    }
    
    private func configureActionButton() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.title = "Set"
            configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer{ incoming in
                var outgoing = incoming
                outgoing.foregroundColor = Colors.Text.primaryText
                outgoing.font = Fonts.subtitleFont
                return outgoing
            }
            actionButton.configuration = configuration
        } else {
            actionButton.setTitle("Set", for: .normal)
            actionButton.titleLabel?.font = Fonts.subtitleFont
            actionButton.setTitleColor(Colors.Text.primaryText, for: .normal)
        }
        actionButton.backgroundColor = Colors.Button.primaryColor
        actionButton.layer.cornerRadius = 10
        actionButton.addTarget(self, action: #selector(didTapActionBtn), for: .touchUpInside)
    }
    
    
    @objc func didTapActionBtn() {
        guard let item = dataSource?.dataForIndex(at: selectedIndex).getTitle() else { return }
        self.delegate?.didSelectItem(title: item)
    }
}


extension AiOPicker: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource?.numberOfItems() ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource?.dataForIndex(at: row).getTitle()
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
}
