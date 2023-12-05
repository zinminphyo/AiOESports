//
//  RankingCollectionViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    
    private var containerView: UIView = {
       let view = UIView()
        return view
    }()
    
    private var teamImageView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        return imgView
    }()
    
    private var teamNameLabel: UILabel = {
        let lbl = UILabel(frame: .zero)
        return lbl
    }()
    
    private var gameCategoryImageView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        return imgView
    }()
    
    private var locationLabel: UILabel = {
        let lbl = UILabel(frame: .zero)
        return lbl
    }()
    
    private var rankLabel: UILabel = {
        let lbl = UILabel(frame: .zero)
        return lbl
    }()
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    private func configureHierarchy() {
        configureContentView()
        configureContainerView()
        configureTeamImageView()
        configureTeamLabel()
        configureGameCategoryImageView()
        configureLocationLabel()
        configureRankLabel()
    }
    
    private func configureContentView() {
        self.backgroundColor = UIColor.clear
    }
    
    private func configureContainerView() {
        self.addSubview(containerView)
        containerView.backgroundColor = Colors.Theme.inputColor
        containerView.layer.cornerRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4)
        ])
    }
    
    private func configureRankLabel() {
        containerView.addSubview(rankLabel)
        rankLabel.font = Fonts.subtitleFont
        rankLabel.text = "1"
        rankLabel.textColor = UIColor.white
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
            rankLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 8)
        ])
    }
    
    private func configureTeamImageView() {
        containerView.addSubview(teamImageView)
        teamImageView.contentMode = .scaleAspectFill
        teamImageView.clipsToBounds = true
        teamImageView.layer.cornerRadius = 7
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            teamImageView.widthAnchor.constraint(equalToConstant: 40),
            teamImageView.heightAnchor.constraint(equalToConstant: 40),
            teamImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0)
        ])
    }
    
    private func configureTeamLabel() {
        containerView.addSubview(teamNameLabel)
        teamNameLabel.textColor = UIColor.white
        teamNameLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        teamNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamNameLabel.leadingAnchor.constraint(equalTo: teamImageView.trailingAnchor, constant: 8),
            teamNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12)
        ])
    }
    
    private func configureGameCategoryImageView() {
        containerView.addSubview(gameCategoryImageView)
        gameCategoryImageView.contentMode = .scaleAspectFill
        gameCategoryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameCategoryImageView.leadingAnchor.constraint(equalTo: teamNameLabel.leadingAnchor, constant: 0),
            gameCategoryImageView.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 5),
            gameCategoryImageView.heightAnchor.constraint(equalToConstant: 15),
            gameCategoryImageView.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    private func configureLocationLabel() {
        containerView.addSubview(locationLabel)
        locationLabel.font = .systemFont(ofSize: 12, weight: .regular)
        locationLabel.textColor = Colors.Text.primaryText
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: gameCategoryImageView.trailingAnchor, constant: 4),
            locationLabel.topAnchor.constraint(equalTo: gameCategoryImageView.topAnchor, constant: 0),
            locationLabel.bottomAnchor.constraint(equalTo: gameCategoryImageView.bottomAnchor, constant: 0),
            locationLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
    }
    
    @discardableResult
    func set(teamImage: UIImage?, teamName: String, gameImage: UIImage?, location: String) -> Self {
        teamImageView.image = teamImage
        teamNameLabel.text = teamName
        gameCategoryImageView.image = gameImage
        locationLabel.text = location
        return self
    }
    
    @discardableResult
    func set(team: TeamObject) -> Self {
        teamImageView.kf.setImage(with: URL(string: team.coverImageFullPath))
        teamNameLabel.text = team.name
        gameCategoryImageView.image = Images.TeamImages.gamecategorylogo
        locationLabel.text = team.location
        return self
    }
    
    @discardableResult
    func set(presentable: RankPresentable) -> Self {
        teamImageView.kf.setImage(with: URL(string: presentable.getImageURLPath()), placeholder: Images.Placeholder.profile)
        teamNameLabel.text = presentable.getName()
        gameCategoryImageView.image = Images.GameImages.getImage(gameName: presentable.getGameType())
        locationLabel.text = presentable.getLocation()
        return self
    }
    
    func render(rank: RankListsView.RankModel) {
        teamImageView.kf.setImage(with: URL(string: "\(NetworkBaseURLs.shared.baseURL)/\(rank.imageURL)"))
        teamNameLabel.text = rank.name
        gameCategoryImageView.image = Images.GameImages.getImage(gameName: rank.game)
        locationLabel.text = rank.location
    }
    
}
