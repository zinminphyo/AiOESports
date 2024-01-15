//
//  VersionUpdateController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import UIKit




class VersionUpdateController: UIViewController {
    
    var tappedVersionUpdate: () -> () = {  }
    
    override var transitioningDelegate: UIViewControllerTransitioningDelegate? { get { self }  set { } }
    
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { .custom } set {}
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction
    private func didTapVersionUpdate(_ sender: UIButton) {
        tappedVersionUpdate()
    }
    
    @IBAction
    private func didTapDismiss(_ sender: UIButton) {
        dismiss(animated: true)
    }

}

extension VersionUpdateController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingBackgroundPresentationController(
            presentedViewController: presented,
            presenting: presenting
        )
    }
}
