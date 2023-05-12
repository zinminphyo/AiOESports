//
//  OnboardingImageCollectionCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 21/03/2023.
//

import UIKit

class OnboardingImageCollectionCell: UICollectionViewCell {
    
    private var imageView: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFill
        return img
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
    
    
    private func configureHierarchy() {
        self.addSubview(imageView)
        self.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    
    @discardableResult
    func set(image: UIImage?) -> Self {
        self.imageView.image = image
        return self
    }
    
    @discardableResult
    func set(url: String) -> Self {
        return self
    }
}
