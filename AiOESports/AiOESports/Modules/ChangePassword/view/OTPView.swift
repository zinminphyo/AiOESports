//
//  OTPView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/11/2023.
//

import Foundation
import UIKit

class OTPView: UIControl {
    /// Background color for OTP code label blocks
    @IBInspectable var labelBackgroundColor: UIColor = .white {
        didSet {
            updateLabels()
        }
    }
    /// Highlight border color for current OTP code label block.
    @IBInspectable var highlightColor: UIColor = .black {
        didSet {
            updateLabels()
        }
    }
    /// Normal border color for OTP code label blocks.
    @IBInspectable var normalColor: UIColor = .lightGray {
        didSet {
            updateLabels()
        }
    }
    /// Spacing between each label blocks.
    @IBInspectable var spacing: CGFloat = 0 {
        didSet {
            stackView.spacing = spacing
            invalidateIntrinsicContentSize()
        }
    }
    /// Number of code label blocks to handle.
    @IBInspectable var labelCount: UInt = 0 {
        didSet {
            addOrRemoveLabels()
            updateLabels()
            invalidateIntrinsicContentSize()
        }
    }
    /// Clear currently entered OTP code.
    func clear() {
        hiddenTextField.text = ""
        text = ""
    }
    private var hiddenTextField = UITextField()
    private var labels: [UILabel] = []
    private var stackView: UIStackView!
    /// Currently rendered otp text.
    /// If the new text has more characters than allowed,
    /// only the characters within the label count limit are displayed.
    @IBInspectable var text: String = "" {
        didSet {
            updateLabels()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    private func setup() {
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        addSubview(stackView)
        setupHiddenTextField()
        addSubview(hiddenTextField)
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClick))
        addGestureRecognizer(tap)
    }
    private func setupHiddenTextField() {
        hiddenTextField.frame = .zero
        hiddenTextField.keyboardType = .numberPad
        hiddenTextField.autocorrectionType = .no
        /// for automatic picking of **code**, **LoginCode** and **OTP Code**s.
        hiddenTextField.textContentType = .oneTimeCode
        hiddenTextField.returnKeyType = .done
        hiddenTextField.delegate = self
        hiddenTextField.addTarget(
            self, action: #selector(textFieldDidChange),
            for: .editingChanged
        )
    }
    private func addOrRemoveLabels() {
        // if desired label count and
        // existing label count are the same
        // stop wasting time
        if labelCount == labels.count { return }
        // if desired label size is zero
        // remove all label
        guard labelCount != .zero
        else {
            removeAllLabels()
            return
        }
        if labelCount < labels.count {
            // remove the excess labels
            for i in (0..<labels.count).reversed() {
                if (i >= labelCount) {
                    labels[i].removeFromSuperview()
                    labels.remove(at: i)
                }
            }
        } else {
            var additional = abs(labels.count - Int(labelCount))
            // add new additional/missing labels
            while(additional > 0) {
                let lbl = makeLabel()
                stackView.addArrangedSubview(lbl)
                labels.append(lbl)
                additional -= 1
            }
        }
    }
    private func makeLabel() -> UILabel {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.layer.cornerRadius = 12
        lbl.layer.cornerCurve = .continuous
        lbl.layer.borderWidth = 1
        lbl.layer.masksToBounds = true
        lbl.font = Fonts.subtitleFont
        return lbl
    }
    private func removeAllLabels() {
        if labels.isEmpty { return }
        labels.forEach{ $0.superview != nil ? $0.removeFromSuperview() : () }
        labels.removeAll()
    }
    private func updateLabels() {
        let characters = text.map(String.init)
        for (i, each) in labels.enumerated() {
            // only render available characters
            // otherwise, render empty string
            each.text = i < characters.count ? characters[i] : ""
            each.backgroundColor = labelBackgroundColor
            // label count: 6
            // text: 1234
            // blocks: 1 2 3 4 [] _
            let isNextBlock = i == characters.count
            // label count: 6
            // text: 123456
            // blocks: 1 2 3 4 5 [6]
            let isTextFullAndLastBlock = i == characters.count - 1 && characters.count == labelCount
            let fromColor = each.layer.borderColor
            // if the view is currently focused
            // and curent block is the one to highlight
            if hiddenTextField.isFirstResponder && (isNextBlock || isTextFullAndLastBlock) {
                each.layer.borderColor = highlightColor.cgColor
            } else {
                each.layer.borderColor = normalColor.cgColor
            }
            animateBorderColor(on: each, from: fromColor)
        }
    }
    private func animateBorderColor(
        on view: UIView,
        from: CGColor? = nil, to: CGColor? = nil,
        duration: CFTimeInterval = 0.25
    ) {
        let id = "animation_layer.borderColor"
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.borderColor))
        animation.fromValue = from ?? view.layer.borderColor ?? UIColor.clear.cgColor
        animation.toValue = to ?? view.layer.borderColor ?? UIColor.clear.cgColor
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.isRemovedOnCompletion = true
        // remove animation if it exists
        view.layer.removeAnimation(forKey: id)
        // add animation
        view.layer.add(animation, forKey: id)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutStackView()
    }
    private func layoutStackView() {
        stackView.frame = bounds
    }
    override var intrinsicContentSize: CGSize {
        // For autolayout automatic resizing if allowed
        CGSize(
            width: CGFloat(labelCount) * 49 + max(0, CGFloat(labelCount) - 1) * spacing,
            height: 68
        )
    }
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // For sizeToFit() i.e frame based layout
        // Note: How this will look with sizeToFit() is untested
        let desiredSize = intrinsicContentSize
        // if given width is zero, assume desired width
        // else take the lowest one.
        // likewise for height
        return CGSize(
            width: size.width > 0 ? min(desiredSize.width, size.width) : desiredSize.width,
            height: size.height > 0 ? min(desiredSize.height, size.height) : desiredSize.height
        )
    }
    override var canBecomeFirstResponder: Bool {
        hiddenTextField.canBecomeFirstResponder
    }
    override func becomeFirstResponder() -> Bool {
        hiddenTextField.becomeFirstResponder()
    }
    override func resignFirstResponder() -> Bool {
        return hiddenTextField.resignFirstResponder()
    }
    @objc
    private func onClick() {
        _ = becomeFirstResponder()
    }
}
extension OTPView: UITextFieldDelegate {
    @objc
    func textFieldDidChange() {
        self.text = hiddenTextField.text ?? ""
        guard self.text.count == labelCount else { return }
        hiddenTextField.resignFirstResponder()
        sendActions(for: .valueChanged)
    }
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let text = textField.text ?? ""
        let nsText = text as NSString
        let newText = nsText.replacingCharacters(in: range, with: string)
        // if next text result in characters more than allowed
        // prevent change
        if newText.count > labelCount {
            return false
        } else {
            return true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        _ = resignFirstResponder()
        sendActions(for: .editingDidEnd)
        updateLabels()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        sendActions(for: .editingDidBegin)
        updateLabels()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        _ = resignFirstResponder()
        return false
    }
}
// MARK: Shaky Shaky
extension OTPView {
    func shake() {
        //    shake(axis: .horizontal)
    }
}
