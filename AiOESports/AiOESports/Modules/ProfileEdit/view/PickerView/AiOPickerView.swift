//
//  AiOPickerView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit


protocol AiOPickerViewDelegate {
    func didSelectItem(in view: AiOPickerView, for value: String)
}

class AiOPickerView: UIView, NibLoadable {
    
    var items: [String] = []
    
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var pickerView: UIPickerView!
    
    var delegate: AiOPickerViewDelegate? = nil

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
        configurePicker()
    }
    
    private func configurePicker() {
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.setValue(UIColor.white, forKey: "textColor")
    }

}


extension AiOPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
}

extension AiOPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.didSelectItem(in: self, for: items[row])
    }
}
