//
//  UpdateSquadTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/01/2024.
//

import UIKit

class UpdateSquadTableViewCell: UITableViewCell {
    
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var lists: UITableView!
    @IBOutlet private(set) var listsHeight: NSLayoutConstraint!
    
    
    
    private var playerLists: [Player_Of_Squad] = [] {
        didSet {
            lists.reloadData()
            listsHeight.constant = CGFloat(46 * playerLists.count)
        }
    }
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    
    
    
    struct Player_Of_Squad {
        let imageURL: String
        let name: String
        let country: String
        let city: String
        let lane: String?
    }
    
    struct SquadModel {
        let title: String
        let playerLists: [Player_Of_Squad]
        
        init(coach: CoachModel) {
            title = coach.role ?? ""
            playerLists = [.init(imageURL: coach.playerImageFullURL, name: coach.name ?? "", country: coach.countryImageFullURL, city: coach.city ?? "", lane: nil)]
        }
        
        init(roaster: [RosterModel]) {
            title = "Roster"
            playerLists = roaster.compactMap{ .init(imageURL: $0.playerImageFullURL, name: $0.name ?? "", country: $0.countryImageFullURL, city: $0.city ?? "", lane: $0.laneImageFullURL) }
        }
        
        init(title: String, achievements: [AchivementModel]) {
            self.title = title
            playerLists = achievements.compactMap{ .init(imageURL: $0.logoFullPath, name: $0.name, country: $0.logoFullPath, city: $0.renderablePlace, lane: nil) }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lists.register(UINib(nibName: String(describing: SquadItemCell.self), bundle: nil), forCellReuseIdentifier: SquadItemCell.reuseIdentifier)
        lists.separatorStyle = .none
        lists.dataSource = self
        lists.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    func render(_ squad: SquadModel) {
        playerLists = squad.playerLists
        titleLabel.text = squad.title
    }
    
}

extension UpdateSquadTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SquadItemCell.reuseIdentifier, for: indexPath) as! SquadItemCell
        cell.render(playerLists[indexPath.row])
        return cell
    }
}


extension UpdateSquadTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
}
