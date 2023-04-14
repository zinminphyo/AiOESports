//
//  ImageCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView = {
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
    
    
    private func configureHierarchy() {
        configureCotainerView()
        configureImageView()
    }
    
    private func configureCotainerView() {
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.clipsToBounds = true
    }
    
    private func configureImageView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    @discardableResult
    func set(image: UIImage?) -> Self {
        self.imageView.image = image
        return self
    }
    
    @discardableResult
    func set(url: String) -> Self {
        imageView.kf.setImage(with: URL(string: url))
        return self
    }
}
