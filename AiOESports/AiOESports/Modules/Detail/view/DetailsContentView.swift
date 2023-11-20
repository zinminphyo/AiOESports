//
//  DetailsContentView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 20/11/2023.
//

import UIKit

class DetailsContentView: UIView, NibLoadable {
    
    
    @IBOutlet private(set) var contentScrollView: UIScrollView!
    
    var views: [UIView] = [] {
        didSet {
            configureContentViews()
        }
    }
    

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
        configureBackground()
        configureContentViews()
    }
    
    private func configureBackground() {
        contentScrollView.backgroundColor = Colors.Theme.inputColor
        contentScrollView.isPagingEnabled = true
        backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureContentViews() {
        var x: CGFloat = 0.0
        views.forEach {
            print("X is \(x)")
            $0.frame = CGRect(x: x, y: 0, width: bounds.width, height: bounds.height)
            contentScrollView.addSubview($0)
            x += bounds.width
        }
        let width = bounds.width * CGFloat(views.count)
        print("Width is \(width)")
        contentScrollView.contentSize = CGSize(width: bounds.width * CGFloat(views.count), height: bounds.height)
    }

}
