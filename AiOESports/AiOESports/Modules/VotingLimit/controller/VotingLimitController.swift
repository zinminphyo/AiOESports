//
//  VotingLimitController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 22/01/2024.
//

import UIKit

class VotingLimitController: UIViewController {
    
    override var transitioningDelegate: UIViewControllerTransitioningDelegate? {
        get { self } set {}
    }
    
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { .custom } set {}
    }
    
    var tappedUpgradePremium: () -> () = {}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction
    private func didTapGotItBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction
    private func didTapUpgradeToPremium(_ sender: UIButton) {
        dismiss(animated: true) {
            self.tappedUpgradePremium()
        }
        
    }
    

}


extension VotingLimitController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        DimmingBackgroundPresentationController(
            presentedViewController: presented,
            presenting: presenting
        )
    }
}
