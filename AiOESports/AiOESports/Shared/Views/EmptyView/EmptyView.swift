//
//  EmptyView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import UIKit

class EmptyView: UIView, NibLoadable {
    
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var emptyTitleLabel: UILabel!
    
    
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
        configureContentContainerView()
        configureEmptyTitleLabel()
    }
    
    private func configureContentContainerView() {
        contentContainerView.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureEmptyTitleLabel() {
        emptyTitleLabel.font = Fonts.titleFont
        emptyTitleLabel.textColor = Colors.Text.primaryText
        emptyTitleLabel.numberOfLines = 0
        emptyTitleLabel.textAlignment = .center
    }
    
    @discardableResult
    func set(emptyString: String) -> Self {
        emptyTitleLabel.text = emptyString
        return self
    }

}
