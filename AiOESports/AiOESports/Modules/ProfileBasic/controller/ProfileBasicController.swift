//
//  ProfileBasicController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/11/2023.
//

import UIKit

class ProfileBasicController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}


extension ProfileBasicController {
    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction
    private func didTapEdit(_ sender: UIButton) {
        let vc = ProfileEditController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
