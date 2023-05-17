//
//  ForgotPassword.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/05/2023.
//

import UIKit

class ForgotPassword: UIViewController {

    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureTitleLabel()
    }
    
    private func configureTitleLabel() {
        headerTitleLabel.font = Fonts.subtitleFont
    }
    
    @IBAction func didTapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
