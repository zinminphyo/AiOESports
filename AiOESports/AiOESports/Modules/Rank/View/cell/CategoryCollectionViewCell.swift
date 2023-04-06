//
//  CategoryCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private var categoryLabel: UILabel = {
        let lbl = UILabel(frame: .zero)
        return lbl
    }()
    
    private var selectionView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    static var resuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureHierarchy() {
        configureCategoryLabel()
        configureSelectionView()
    }
    
    private func configureCategoryLabel() {
        self.addSubview(categoryLabel)
        categoryLabel.textColor = Colors.Text.primaryText
        categoryLabel.font = Fonts.subtitleFont
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0)
        ])
    }
    
    private func configureSelectionView() {
        self.addSubview(selectionView)
        selectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            selectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            selectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 4),
            selectionView.heightAnchor.constraint(equalToConstant: 5),
            selectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    @discardableResult
    func set(name: String, isSelected: Bool) -> Self {
        self.categoryLabel.text = name
        self.selectionView.backgroundColor = isSelected ? Colors.Button.primaryColor : Colors.Button.secondaryColor
        return self
    }
    
    @discardableResult
    func set(isSelected: Bool) -> Self {
        self.selectionView.backgroundColor = isSelected ? Colors.Button.primaryColor : Colors.Button.secondaryColor
        return self
    }
}
