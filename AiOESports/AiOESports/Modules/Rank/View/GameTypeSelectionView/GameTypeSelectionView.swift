//
//  GameTypeSelectionView.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 19/12/2023.
//

import UIKit

class GameTypeSelectionView: UIView, NibLoadable {
    
    @IBOutlet private(set) var collectionView: UICollectionView!
    let games = GameType.allCases
    
    
    @IBInspectable var selectedIndex: Int = 0 {
        didSet {
            updateUI()
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
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.register(GameCategoryCollectionViewCell.self, forCellWithReuseIdentifier: GameCategoryCollectionViewCell.reuseIdentifier)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    private func updateUI() {
        collectionView.reloadData()
    }

}


// MARK: - UICollection View

extension GameTypeSelectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! GameCategoryCollectionViewCell
        let image = indexPath.row == selectedIndex ? games[indexPath.row].selectedStateImage : games[indexPath.row].unselectedStateImage
        cell.set(image: image)
        return cell
    }
}


extension GameTypeSelectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        return CGSize(width: height, height: height)
    }
}
