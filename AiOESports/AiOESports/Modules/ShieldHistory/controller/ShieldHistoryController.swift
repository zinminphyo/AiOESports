//
//  ShieldHistoryController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 19/01/2024.
//

import UIKit

class ShieldHistoryController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction
    private func didTapBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
