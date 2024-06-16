//
//  RankingController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/06/2024.
//

import UIKit

class RankingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction
    private func didChangeRankListHeaderSelection(_ sender: RankListHeaderView) {
        print("Selected index is \(sender.selectedIndex)")
    }



}
