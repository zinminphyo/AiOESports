//
//  Search.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import UIKit

class Search: UIViewController {
    
    @IBOutlet weak var searchInputTxtField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureSearchInputTextField()
    }
    
    private func configureSearchInputTextField() {
        let placeHolder = "Enter PLAYER Name"
        let attributedPlaceHolder = NSMutableAttributedString(string: placeHolder)
        attributedPlaceHolder.addAttribute(.foregroundColor, value: Colors.Text.primaryText, range: NSRange(location: 0, length: placeHolder.count))
        searchInputTxtField.attributedPlaceholder = attributedPlaceHolder
        
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        searchButton.addTarget(self, action: #selector(didTapSearchBtn), for: .touchUpInside)
        searchButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 10)
        searchButton.backgroundColor = UIColor.clear
        searchButton.setImage(Images.RankModuleImages.searchlogo, for: .normal)
        searchButton.tintColor = UIColor.white
        searchInputTxtField.rightView = searchButton
        searchInputTxtField.rightViewMode = .always
    }
    
    @objc func didTapSearchBtn() {
        
    }

}
