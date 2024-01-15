//
//  UnderMaintenanceController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import UIKit

class UnderMaintenanceController: UIViewController {
    
    override var transitioningDelegate: UIViewControllerTransitioningDelegate? {
        get { self } set {}
    }
    
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { .custom } set {}
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction
    private func didTapExit(_ sender: UIButton) {
        dismiss(animated: true)
    }

}


extension UnderMaintenanceController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingBackgroundPresentationController(
            presentedViewController: presented,
            presenting: presenting
        )
    }
}
