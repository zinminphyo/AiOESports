//
//  GameCategoryCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import UIKit
import Kingfisher

class GameCategoryCollectionViewCell: UICollectionViewCell {
    
    private var gameCategoryImageView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        return imgView
    }()
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    private func configureHierarchy() {
        configureContainerView()
        configureImageView()
    }
    
    private func configureContainerView() {
        
        self.backgroundColor = Colors.Theme.inputColor
    }
    
    private func configureImageView() {
        self.addSubview(gameCategoryImageView)
        gameCategoryImageView.contentMode = .scaleToFill
        gameCategoryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameCategoryImageView.widthAnchor.constraint(equalToConstant: 30),
            gameCategoryImageView.heightAnchor.constraint(equalToConstant: 30),
            gameCategoryImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            gameCategoryImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        ])
    }
    
    @discardableResult
    func set(image: UIImage?) -> Self {
        self.gameCategoryImageView.image = image
        return self
    }
    
    @discardableResult
    func set(url: String) -> Self {
        self.gameCategoryImageView.kf.setImage(with: URL(string: url))
        return self
    }
}
