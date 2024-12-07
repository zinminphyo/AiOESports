//
//  TeamRankingController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 18/06/2024.
//

import UIKit

class TeamRankingController: UIViewController {

    @IBOutlet private var collectionView: UICollectionView!

    let games = GameType.allCases

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureCollectionView()
    }

    private func configureCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(GameCategoryCollectionViewCell.self, forCellWithReuseIdentifier: GameCategoryCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()
    }

    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { section, env in
            let width: NSCollectionLayoutDimension = section == 0 ? .absolute(50) : .fractionalWidth(1.0)
            let item = NSCollectionLayoutItem(layoutSize: .init(
                widthDimension: width,
                heightDimension: .fractionalHeight(1.0))
            )
            let height: NSCollectionLayoutDimension = section == 0 ? .absolute(50) : .fractionalHeight(0.3)

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: height
            ), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            return section
        }
    }

}


extension TeamRankingController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? games.count : 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! GameCategoryCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.contentView.backgroundColor = .red
            return cell
        }
    }
}
