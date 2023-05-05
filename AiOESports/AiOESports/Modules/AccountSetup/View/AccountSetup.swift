//
//  AccountSetup.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 30/04/2023.
//

import UIKit

class AccountSetup: UIViewController {

    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var firstStepView: UIView!
    @IBOutlet weak var secondStepView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureBackBtn()
        configureFirstStepView()
        configureSecondStepView()
        configureContentScrollView()
    }
    
    private func configureBackBtn() {
        backBtn.addTarget(self, action: #selector(didTapBackBtn), for: .touchUpInside)
    }
    
    private func configureFirstStepView() {
        firstStepView.layer.cornerRadius = 1
        firstStepView.backgroundColor = Colors.Button.primaryColor
    }
    
    private func configureSecondStepView() {
        secondStepView.layer.cornerRadius = 1
        secondStepView.backgroundColor = Colors.Theme.inputColor
    }
    
    private func configureContentScrollView() {
        guard let uploadProfileVC = UploadProfileModule.createModule(), let vc1 = uploadProfileVC.view else { return }
        vc1.frame = CGRect(x: 0, y: 0, width: contentScrollView.frame.width, height: contentScrollView.frame.height)
        uploadProfileVC.willMove(toParent: self)
        addChild(uploadProfileVC)
        uploadProfileVC.didMove(toParent: self)
        contentScrollView.addSubview(vc1)
        
        guard let profileInfoVC = ProfileInfoModule.createModule(), let v2 = profileInfoVC.view else { return }
        v2.frame = CGRect(x: contentScrollView.frame.width, y: 0, width: contentScrollView.frame.width, height: contentScrollView.frame.height)
        profileInfoVC.willMove(toParent: self)
        addChild(profileInfoVC)
        profileInfoVC.didMove(toParent: self)
        contentScrollView.addSubview(v2)
        
        contentScrollView.isPagingEnabled = true
        contentScrollView.isScrollEnabled = true
        contentScrollView.showsVerticalScrollIndicator = false
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.contentSize = CGSize(width: contentScrollView.frame.width * 2, height: contentScrollView.frame.height)
    }
    
    @objc func didTapBackBtn() {
        self.navigationController?.popViewController(animated: true)
    }

}
