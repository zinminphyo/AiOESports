//
//  GameImagesTableViewCell.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/04/2023.
//

import UIKit

class GameImagesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainGameImageView: UIImageView!
    @IBOutlet weak var seperatorView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    private var subGames: [SubGameModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        selectionStyle = .none
    }
    
    private func configureHierarchy() {
        configureContentContainerView()
        configureTitleLabel()
        configureMainImageView()
        configureSeperatorView()
        configureCollectionView()
        configureCollectionView()
    }
    
    private func configureContentContainerView() {
        self.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureTitleLabel() {
        titleLabel.font = Fonts.ForCell.subtitleFont
        titleLabel.textColor = Colors.Text.secondaryText
    }
    
    private func configureMainImageView() {
        mainGameImageView.contentMode = .scaleAspectFill
    }
    
    private func configureSeperatorView() {
        seperatorView.backgroundColor = Colors.Theme.SecondaryBackground
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: String(describing: GameImageCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: GameImageCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = SizeInspector.overviewGameIconSize
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 4
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = UIColor.clear
    }
    
    func renderUI(title: String, mainGame: String, subGames: [SubGameModel]) {
        titleLabel.text = title
        mainGameImageView.image = Images.GameImages.getImage(gameName: mainGame)
        seperatorView.isHidden = subGames.count == 0
        self.subGames = subGames
        self.collectionView.reloadData()
    }
    
}


extension GameImagesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameImageCollectionViewCell.reuseIdentifier, for: indexPath) as? GameImageCollectionViewCell else { return UICollectionViewCell() }
        cell.set(gameName: subGames[indexPath.row].game)
        return cell
    }
}
