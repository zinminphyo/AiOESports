//
//  DetailController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 19/11/2023.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet private(set) var contentScrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureContentScrollView()
        
        
    }
    
    @IBAction
    private func didTapBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func configureContentScrollView() {
        guard let vc = AchivementModule.createModule(achivementLists: []) else {return}
        vc.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: contentScrollView.frame.height)
        vc.willMove(toParent: self)
        contentScrollView.addSubview(vc.view)
        vc.didMove(toParent: self)
        contentScrollView.contentSize = CGSize(width: view.frame.width, height: contentScrollView.frame.height)
    }
    


}
