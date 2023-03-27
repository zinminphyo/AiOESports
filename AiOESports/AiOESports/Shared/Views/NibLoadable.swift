//
//  NibLoadable.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 27/03/2023.
//

import Foundation
import UIKit



protocol NibLoadable {
    func loadedByNib()
}


extension NibLoadable where Self: UIView {
    func loadedByNib() {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
