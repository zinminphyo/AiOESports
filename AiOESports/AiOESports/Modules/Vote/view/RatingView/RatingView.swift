//
//  RatingView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/11/2023.
//

import UIKit

class RatingView: UIControl, NibLoadable {
    
    @IBOutlet private(set) var starCountLabel: UILabel!
    @IBOutlet private(set) var oneStarImageView: UIImageView!
    @IBOutlet private(set) var twoStarImageView: UIImageView!
    @IBOutlet private(set) var threeStarImageView: UIImageView!
    @IBOutlet private(set) var fourStarImageView: UIImageView!
    @IBOutlet private(set) var fiveStarImageView: UIImageView!
    
    @IBInspectable var count: Int = 0 {
        didSet {
            updateStars()
            updateStarCountLabel()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
    }
    
    @IBAction
    private func didTapRating(_ sender: UIButton) {
        count = sender.tag
        sendActions(for: .valueChanged)
    }
    
    private func updateStars() {
        let selectedStarCount = 0..<count
        let starImages: [UIImageView] = [
            oneStarImageView, twoStarImageView, threeStarImageView, fourStarImageView, fiveStarImageView
        ]
        starImages.forEach{ $0.image = UIImage(named: "star-unfill") }
        selectedStarCount.forEach{ starImages[$0].image = UIImage(named: "star-fill") }
    }
    
    private func updateStarCountLabel() {
        let starString = count <= 1 ? "star" : "stars"
        starCountLabel.text = "\(count) \(starString)"
    }

    
    
}
