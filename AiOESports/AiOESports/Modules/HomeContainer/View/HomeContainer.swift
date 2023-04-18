//
//  HomeContainer.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/04/2023.
//

import UIKit

class HomeContainer: UIViewController {
    
    private var homeVC: UIViewController = {
        let vc = HomeModule.createModule() ?? UIViewController()
        return vc
    }()
    
    @IBOutlet weak var contentContainerView: UIView!
    
    
    @IBAction func didTapMenuItem(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.homeVC.view.frame.origin.x = self.homeVC.view.frame.width
        }, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureBackgroundView()
        configureSubViews()
    }
    
    private func configureBackgroundView() {
        self.view.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureSubViews() {
        guard let menuVC = MenuModule.createModule() else { return }
        contentContainerView.addSubview(menuVC.view)
        menuVC.willMove(toParent: self)
        addChild(menuVC)
        menuVC.didMove(toParent: self)
        
//        guard let homeVC = HomeModule.createModule() else { return }
        contentContainerView.addSubview(homeVC.view)
        homeVC.willMove(toParent: self)
        addChild(homeVC)
        homeVC.didMove(toParent: self)
    }
    

}
