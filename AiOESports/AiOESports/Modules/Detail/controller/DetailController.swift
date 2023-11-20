//
//  DetailController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 19/11/2023.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet private(set) var contentView: DetailsContentView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let views = (0...2).compactMap {
            let view = UIView()
            view.backgroundColor = $0 % 2 == 0 ? .blue : .red
            return view
        }
        
        contentView.views = views
        
        
    }
    
    @IBAction
    private func didTapBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
  


}
