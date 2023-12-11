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
        let id: Int
        let name: String
        let imageURL: String
        let game: String
        let location: String
        var rank: String = "1"
        let rating: String
        init(team: TeamObject) {
            id = team.id
            name = team.name
            imageURL = team.teamImage ?? ""
            game = team.game
            location = team.city
            rating = String(team.totalRateStar)
        }
        
        init(player: PlayerObject) {
            id = player.id
            name = player.name ?? ""
            imageURL = player.playerImage ?? ""
            game = player.game ?? ""
            location = player.city ?? ""
            rating = String(player.totalRateStar)
        }
        
        init(caster: CasterObject) {
            id = caster.id
            name = caster.name ?? ""
            imageURL = caster.playerImage ?? ""
            game = caster.game ?? ""
            location = caster.city ?? ""
            rating = String(caster.total_rate_star)
        }
        
        init(creator: CreatorObject) {
            id = creator.id
            name = creator.name
            imageURL = creator.playerImage ?? ""
            game = creator.game ?? ""
            location = creator.city
            rating = String(creator.total_rate_star)
        }
    }

    @IBOutlet private(set) var listsTblView: UITableView!
    @IBOutlet private(set) var loadingView: LoadingView!
    @IBOutlet private(set) var emptyView: UIView!
    
    lazy var tableHeaderView: UIImageView = {
        let imgView = UIImageView(frame: .init(x: 0, y: 0, width: listsTblView.bounds.width, height: 180))
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    private var _lists: [RankModel] = []
    var lists: [RankModel] = [] {
        didSet {
          updateLists()
        }
    }
    
    var gameType: GameType = .All {
        didSet {
            updateOnGameType()
        }
    }
    
    private var _index: Int? = nil
    var selectedIndex: Int? {
        get { _index }
    }
    
    var selectedId: Int? {
        guard let selectedIndex = selectedIndex else { return nil }
        return _lists[selectedIndex].id
    }
    
    var coverImage: String = "" {
        didSet {
            updateCoverImage()
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
        listsTblView.tableHeaderView = tableHeaderView
        listsTblView.separatorStyle = .none
    }
    
    private func configureTableView() {
        listsTblView.register(UINib(nibName: String(describing: RankCell.self), bundle: nil), forCellReuseIdentifier: RankCell.reuseIdentifier)
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
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.emptyView.alpha = _lists.isEmpty ? 1.0 : 0.0
        }
    }
    
    private func updateCoverImage() {
        tableHeaderView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(coverImage)"), placeholder: Images.Placeholder.cover)
    }
    
    private func updateOnGameType() {
        let deleteIndexPaths = _lists.indices.compactMap{ IndexPath(row: $0, section: 0) }
        _lists.removeAll()
        listsTblView.deleteRows(at: deleteIndexPaths, with: .fade)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: RankCell.reuseIdentifier, for: indexPath) as! RankCell
            _lists[indexPath.row].rank = String(indexPath.row + 1)
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
        _index = indexPath.row
        sendActions(for: .editingChanged)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let _ = cell as? LoadingTableViewCell, indexPath.section == 1 else { return }
        sendActions(for: .valueChanged)
    }
}
