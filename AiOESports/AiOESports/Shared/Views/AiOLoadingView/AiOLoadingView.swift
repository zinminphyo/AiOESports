//
//  AiOLoadingView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 29/05/2023.
//

import UIKit

class AiOLoadingView: UIView, NibLoadable {

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
    }

}
