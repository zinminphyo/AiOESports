//
//  CommentListsController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import UIKit

class CommentListsController: UIViewController {
    
    @IBOutlet private(set) var starCountFilter: UICollectionView!
    @IBOutlet private(set) var commentListsView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction
    private func didTapDismiss(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
