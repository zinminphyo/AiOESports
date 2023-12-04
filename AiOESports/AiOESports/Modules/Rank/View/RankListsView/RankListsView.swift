//
//  RankListsView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/12/2023.
//

import UIKit

class RankListsView: UIControl, NibLoadable {
    // MARK: Rank Model For UI Rendering
    struct RankModel {
        let name: String
        let imageURL: String
        let game: String
        let location: String
        let rank: String
        let rating: String
        init(team: TeamObject) {
            name = team.name
            imageURL = team.teamImage ?? ""
            game = team.game
            location = team.city
            rank = "1"
            rating = "252"
        }
        
        init(player: PlayerObject) {
            name = player.name ?? ""
            imageURL = player.playerImage ?? ""
            game = player.game ?? ""
            location = player.city ?? ""
            rank = "1"
            rating = "252"
        }
        
        init(caster: CasterObject) {
            name = caster.name ?? ""
            imageURL = caster.playerImage ?? ""
            game = caster.game ?? ""
            location = caster.city ?? ""
            rank = "1"
            rating = "252"
        }
        
        init(creator: CreatorObject) {
            name = creator.name
            imageURL = creator.playerImage ?? ""
            game = creator.game ?? ""
            location = creator.city
            rank = "1"
            rating = "231"
        }
    }

    @IBOutlet private(set) var listsTblView: UITableView!
    @IBOutlet private(set) var loadingView: LoadingView!
    
    private var _lists: [RankModel] = []
    var lists: [RankModel] = [] {
        didSet {
          updateLists()
        }
    }
    
    var hasMore: Bool = false {
        didSet {
            listsTblView.reloadSections([1], with: .fade)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadedByNib()
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadedByNib()
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureBackgroundView()
        configureTableView()
    }
    
    private func configureBackgroundView() {
        backgroundColor = .clear
        listsTblView.showsVerticalScrollIndicator = false
        listsTblView.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureTableView() {
        listsTblView.register(RankingTableViewCell.self, forCellReuseIdentifier: RankingTableViewCell.reuseIdentifier)
        listsTblView.register(LoadingTableViewCell.self, forCellReuseIdentifier: LoadingTableViewCell.reuseIdentifier)
        listsTblView.dataSource = self
        listsTblView.delegate = self
    }
    
    private func updateLists() {
        listsTblView.beginUpdates()
        let indexPaths: [IndexPath] = lists.indices.compactMap{ IndexPath(row: $0 + _lists.count, section: 0) }
        _lists.append(contentsOf: lists)
        listsTblView.insertRows(at: indexPaths, with: .fade)
        listsTblView.endUpdates()
    }
}


extension RankListsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let loadingCount = hasMore ? 1 : 0
        return section == 0 ? _lists.count : loadingCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableViewCell.reuseIdentifier, for: indexPath) as! RankingTableViewCell
            cell.render(rank: _lists[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.reuseIdentifier, for: indexPath) as! LoadingTableViewCell
            cell.startAnimation()
            return cell
        }
    }
}


extension RankListsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let _ = cell as? LoadingTableViewCell, indexPath.section == 1 else { return }
        sendActions(for: .valueChanged)
    }
}
