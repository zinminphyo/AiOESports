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
    
    private func configureTeamImageView() {
        containerView.addSubview(teamImageView)
        teamImageView.contentMode = .scaleAspectFill
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            teamImageView.widthAnchor.constraint(equalToConstant: 30),
            teamImageView.heightAnchor.constraint(equalToConstant: 30),
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
    
}
