//
//  ProfileInfoView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class ProfileInfoView: UIView, NibLoadable {
    
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var valueLabel: UILabel!
    
    private var _title: String = ""
    @IBInspectable var title: String {
        set {
            titleLabel.text = newValue
            _title = newValue
        }
        get { _title }
    }
    
    
    private var _value: String = ""
    @IBInspectable var value: String {
        set {
            valueLabel.text = newValue
            _value = newValue
        }
        get { _value }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
    }

}
