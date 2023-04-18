//
//  Menu.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/04/2023.
//

import UIKit

class Menu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    
    
    private func configureHierarchy() {
        configureContainerView()
    }

    private func configureContainerView() {
        self.view.backgroundColor = Colors.TabItem.match
    }
    
}
