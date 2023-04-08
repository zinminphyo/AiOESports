//
//  Details.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit

class Details: UIViewController {
    
    @IBOutlet weak var contentScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureContentScrollView()
    }
    
    private func configureContentScrollView() {
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.showsVerticalScrollIndicator = false
        contentScrollView.isPagingEnabled = true
        
        let iRange = 0...3
        var x: CGFloat = 0
        for i in iRange {
            x += CGFloat(i) * contentScrollView.frame.width
            guard let vc = SquadModule.createModule() else {return}
            let contentView = vc.view ?? UIView(frame: .zero)
            contentView.frame = CGRect(x: x, y: 0, width: contentScrollView.frame.width, height: contentScrollView.frame.height)
            vc.willMove(toParent: self)
            addChild(vc)
            vc.didMove(toParent: self)
            contentScrollView.addSubview(contentView)
        }
        contentScrollView.contentSize = CGSize(width: CGFloat(iRange.count) * contentScrollView.frame.width, height: contentScrollView.frame.height)
    }

}
