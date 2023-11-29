//
//  CommentView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/11/2023.
//

import UIKit

class CommentView: UIControl, NibLoadable {
    
    @IBOutlet private(set) var inputTextView: UITextView!
    @IBOutlet private(set) var remainingCountLabel: UILabel!
    @IBOutlet private(set) var placeholderTextLabel: UILabel!
    
    private let userInputMaximumCount: Int = 200
    private var userInputTextCount: Int = 0
    
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
        configureInputTextView()
    }
    
    private func configureInputTextView() {
        inputTextView.delegate = self
        inputTextView.isScrollEnabled = true
    }
    

}


extension CommentView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let oldText = textView.text ?? ""
        let updatedText = NSString(string: oldText).replacingCharacters(in: range, with: text)
        print("Updated text is \(updatedText)")
        placeholderTextLabel.isHidden = !updatedText.isEmpty
        userInputTextCount = updatedText.count
        let remainingCount = userInputMaximumCount - userInputTextCount
        guard remainingCount >= 0 else { return false }
        remainingCountLabel.text = String(remainingCount)
        return userInputTextCount <= userInputMaximumCount
    }
    
    
}
