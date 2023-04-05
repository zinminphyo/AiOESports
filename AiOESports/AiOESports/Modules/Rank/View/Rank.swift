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
    
    var presenter: RankPresenting?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
        
        presenter?.fetchTeamLists()
    }
    
    private func configureHierarchy() {
        configureCategoryCollectionView()
        configureGameCategoryCollectionView()
        configureTableView()
    }
    
    private func configureCategoryCollectionView() {
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.resuseIdentifier)
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 10
        flowLayout.estimatedItemSize = CGSize(width: 100, height: categoryCollectionView.frame.height)
        categoryCollectionView.showsVerticalScrollIndicator = false
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.collectionViewLayout = flowLayout
        categoryCollectionView.allowsMultipleSelection = false
        categoryCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    private func configureGameCategoryCollectionView() {
        gameCategoryCollectionView.register(GameCategoryCollectionViewCell.self, forCellWithReuseIdentifier: GameCategoryCollectionViewCell.reuseIdentifier)
        gameCategoryCollectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: gameCategoryCollectionView.frame.height, height: gameCategoryCollectionView.frame.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        gameCategoryCollectionView.collectionViewLayout = flowLayout
        gameCategoryCollectionView.showsVerticalScrollIndicator = false
        gameCategoryCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureTableView() {
        tableView.register(RankingTableViewCell.self, forCellReuseIdentifier: RankingTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
    }
    
    @IBAction func didTapSearchBtn(_ sender: UIButton) {
    }
    
    @IBAction func didTapFilterBtn(_ sender: UIButton) {
        presenter?.tappedFilerSettingBtn()
    }
    
    
}


extension Rank: RankViewDelegate {
    
}


extension Rank: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == categoryCollectionView ? 4 : 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.resuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.set(name: "TEAMS", isSelected: indexPath.row == 0)
            return cell
        } else if collectionView == gameCategoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? GameCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.set(image: UIImage(named: "All"))
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == categoryCollectionView else { return }
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else { return }
        cell.set(isSelected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard collectionView == categoryCollectionView, let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else { return }
        cell.set(isSelected: false)
    }
}

extension Rank: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableViewCell.reuseIdentifier, for: indexPath) as? RankingTableViewCell else {
            return UITableViewCell()
        }
        cell.set(teamImage: Images.TeamImages.teamlogo, teamName: "Blacklist", gameImage: Images.TeamImages.gamecategorylogo, location: "Yangon")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}
