//
//  LoadingPresentable.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 06/04/2023.
//

import Foundation
import UIKit
import SVProgressHUD

protocol LoadingPresentable {
    func showLoading()
    func hideLoading()
}

extension LoadingPresentable where Self: UIViewController {
    
    func showLoading() {
        SVProgressHUD.show()
    }
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
}
