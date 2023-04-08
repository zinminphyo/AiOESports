//
//  Squad.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit

class Squad: UIViewController {
    
    @IBOutlet weak var squadTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureContainerView()
        configureTableView()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.inputColor
    }
    
    private func configureTableView() {
        squadTableView.register(UINib(nibName: String(describing: SquadTableViewCell.self), bundle: nil), forCellReuseIdentifier: SquadTableViewCell.reuseIdentifier)
        squadTableView.dataSource = self
        squadTableView.delegate = self
        squadTableView.separatorStyle = .none
    }

}

extension Squad: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 2 ? 10 : 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SquadTableViewCell.reuseIdentifier, for: indexPath) as? SquadTableViewCell else { return UITableViewCell() }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SquadTableViewCell.cellHeight
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Head Coach".uppercased()
        } else if section == 1 {
            return "Assistant Coach".uppercased()
        } else {
            return "Rosters".uppercased()
        }
    }
}
