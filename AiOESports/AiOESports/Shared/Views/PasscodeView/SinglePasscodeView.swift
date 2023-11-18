//
//  SinglePasscodeView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/11/2023.
//

import UIKit


protocol SinglePasscodeViewDelegate: NSObject {
    func didTriggerTextInput(in view: SinglePasscodeView)
}

class SinglePasscodeView: UIView {
    
    private let activeColor: UIColor = UIColor.gray
    private let unActiveColor: UIColor = Colors.Theme.inputColor ?? .tertiarySystemFill
    
    var delegate: SinglePasscodeViewDelegate? = nil
    
    private let label: UILabel = {
       let lbl = UILabel()
        lbl.text = ""
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    var isActive: Bool = false {
        didSet {
            backgroundColor = isActive ? activeColor : unActiveColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureContentView()
        configureLabel()
        configureTapGesture()
    }
    
    private func configureContentView() {
        layer.cornerRadius = 8
        layer.cornerCurve = .continuous
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTriggerTapGesture))
        addGestureRecognizer(tapGesture)
    }
    
    @objc func didTriggerTapGesture() {
        delegate?.didTriggerTextInput(in: self)
    }
    
    private func configureLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
    }
    
    func set(text: String) {
        label.text = text
    }

}
