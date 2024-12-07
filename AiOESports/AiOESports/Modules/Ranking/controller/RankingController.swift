//
//  RankingController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/06/2024.
//

import UIKit

class RankingController: UIViewController {

    @IBOutlet private var contentContainerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction
    private func didChangeRankListHeaderSelection(_ sender: RankListHeaderView) {
        print("Selected index is \(sender.selectedIndex)")
    }

    @IBAction
    private func didTapFilter(_ sender: UIButton) {

    }

    @IBAction
    private func didTapSearch(_ sender: UIButton) {

    }



}
