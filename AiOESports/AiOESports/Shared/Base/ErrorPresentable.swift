//
//  ErrorPresentable.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation
import UIKit
import SVProgressHUD

protocol ErrorPresentable {
    func showError(error: String)
}


extension ErrorPresentable where Self: UIViewController {
    func showError(error: String) {
        SVProgressHUD.show(withStatus: error)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SVProgressHUD.dismiss()
        }
    }
}
