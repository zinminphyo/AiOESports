//
//  TeamRankController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 19/12/2023.
//

import UIKit

class TeamRankController: UIViewController {
    
    @IBOutlet private(set) var gameTypeView: GameTypeSelectionView!
    @IBOutlet private(set) var rankListsView: RankListsView!
    
    private let vm: TeamRankViewModel!
    
    init() {
        vm = TeamRankViewModel()
        super.init(nibName: "TeamRankController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Doesn't support for NSCoder.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
