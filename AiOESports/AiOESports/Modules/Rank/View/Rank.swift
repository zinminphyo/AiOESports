//
//  Rank.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import UIKit

class Rank: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var gameCategoryCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureCategoryCollectionView()
        configureGameCategoryCollectionView()
        configureTableView()
    }
    
    private func configureCategoryCollectionView() {
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.resuseIdentifier)
        categoryCollectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 10
        flowLayout.estimatedItemSize = CGSize(width: 100, height: categoryCollectionView.frame.height)
        categoryCollectionView.showsVerticalScrollIndicator = false
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.collectionViewLayout = flowLayout
    }
    
    private func configureGameCategoryCollectionView() {
        
    }
    
    private func configureTableView() {
        
    }

}


extension Rank: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.resuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.set(name: "TEAMS", isSelected: indexPath.row == 0)
        return cell
    }
}
