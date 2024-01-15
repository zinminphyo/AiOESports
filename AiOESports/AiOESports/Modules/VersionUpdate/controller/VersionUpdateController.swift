//
//  VersionUpdateController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import UIKit




class VersionUpdateController: UIViewController {
    
    
    @IBOutlet private(set) var dismissBtn: UIButton!
    
    var tappedVersionUpdate: () -> () = {  }
    
    override var transitioningDelegate: UIViewControllerTransitioningDelegate? { get { self }  set { } }
    
    override var modalPresentationStyle: UIModalPresentationStyle {
        get { .custom } set {}
    }
    
    private let isForceUpdate: Bool
    

    
    init(isForceUpdate: Bool) {
        self.isForceUpdate = isForceUpdate
        super.init(nibName: "VersionUpdateController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dismissBtn.isHidden = !isForceUpdate
        
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
