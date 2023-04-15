//
//  FormerPlayers.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import UIKit

class FormerPlayers: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: FormerPlayersPresenting?
    private var playerLists: [FormerPlayerModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
        
        presenter?.viewDidLoad()
    }
    

    private func configureHierarchy() {
        self.view.backgroundColor = Colors.Theme.inputColor
        
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: FormerPlayerTableViewCell.self), bundle: nil), forCellReuseIdentifier: FormerPlayerTableViewCell.reuseIdentifier)
        tableView.backgroundColor = Colors.Theme.inputColor
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
    }

}

extension FormerPlayers: FormerPlayersViewDelegate {
    func updateUI(formerPlayers: [FormerPlayerModel]) {
        self.playerLists = formerPlayers
        self.tableView.reloadData()
    }
}


extension FormerPlayers: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerLists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FormerPlayerTableViewCell.reuseIdentifier, for:  indexPath) as? FormerPlayerTableViewCell else { return UITableViewCell() }
        cell.updateUI(formerPlayer: playerLists[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FormerPlayerTableViewCell.cellHeight
    }
}
