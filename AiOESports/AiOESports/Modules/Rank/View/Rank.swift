//
//  Rank.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import UIKit
import SVProgressHUD

class Rank: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var gameCategoryCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: RankPresenting?
    
    private var teamLists: [TeamObject] = []
    private var playerLists: [PlayerObject] = []
    private var loadingLists: [String] = []
    private var filterLists: [RankPresentable] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
        
        presenter?.fetchTeamLists(gameType: .All, status: .all)
    }
    
    private func configureHierarchy() {
        configureHeaderView()
        configureCategoryCollectionView()
        configureGameCategoryCollectionView()
        configureTableView()
    }
    
    private func configureHeaderView() {
        titleLabel.font = Fonts.titleFont
        titleLabel.textColor = Colors.Text.primaryText
        titleLabel.text = "Rank"
    }
    
    private func configureCategoryCollectionView() {
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.resuseIdentifier)
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 0
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
        tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: LoadingTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
    }
    
    @IBAction func didTapSearchBtn(_ sender: UIButton) {
        presenter?.tappedSearchBtn()
    }
    
    @IBAction func didTapFilterBtn(_ sender: UIButton) {
        presenter?.tappedFilerSettingBtn()
    }
    
    
}

// MARK: - View Delegate
extension Rank: RankViewDelegate {
    
    func renderTeamLists(teamLists: [TeamObject]) {
        /*
        let toDeleteIndexs = self.teamLists.indices
        var toDeleteIndexPaths: [IndexPath] = []
        for i in toDeleteIndexs {
            toDeleteIndexPaths.append(IndexPath(row: i, section: 0))
        }
        self.teamLists = []
        self.tableView.deleteRows(at: toDeleteIndexPaths, with: .fade)
        self.teamLists = teamLists
        var toInsertIndexPaths: [IndexPath] = []
        for index in 0..<teamLists.count {
            toInsertIndexPaths.append(IndexPath(row: index, section: 0))
        }
        self.tableView.insertRows(at: toInsertIndexPaths, with: .fade)
         */
//        self.filterLists = teamLists
        self.teamLists = teamLists
        self.tableView.reloadSections([0], with: .fade)
    }
    
    func renderPlayerLists(playerLists: [PlayerObject]) {
        self.filterLists = playerLists
//        self.playerLists = playerLists
        self.tableView.reloadSections([0], with: .fade)
    }
    
    func renderLoadingLists(loadingLists: [String]) {
        /*
        let toDeleteIndexs = self.loadingLists.indices
        var toDeleteIndexPaths: [IndexPath] = []
        for i in toDeleteIndexs {
            toDeleteIndexPaths.append(IndexPath(row: i, section: 1))
        }
        self.loadingLists = []
        self.tableView.deleteRows(at: toDeleteIndexPaths, with: .fade)
        self.loadingLists = loadingLists
        var toInsertIndexPaths: [IndexPath] = []
        for index in 0..<loadingLists.count {
            toInsertIndexPaths.append(IndexPath(row: index, section: 1))
        }
        self.tableView.insertRows(at: toInsertIndexPaths, with: .top)
         */
        self.loadingLists = loadingLists
        self.tableView.reloadData()
    }
    
    func renderRankLists(lists: [RankPresentable]) {
        self.filterLists = lists
        self.tableView.reloadSections([0], with: .fade)
    }
    
    func renderError(error: String) {
        
    }
    
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
}


extension Rank: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == categoryCollectionView ? RankCategory.allCases.count : GameType.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.resuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.set(name: RankCategory.allCases[indexPath.row].title, isSelected: indexPath.row == 0)
            return cell
        } else if collectionView == gameCategoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? GameCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.set(image: GameType.allCases[indexPath.row].image)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == categoryCollectionView else { return }
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else { return }
        cell.set(isSelected: true)
        presenter?.changedRankCategory(category: RankCategory.allCases[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard collectionView == categoryCollectionView, let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else { return }
        cell.set(isSelected: false)
    }
}

extension Rank: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return filterLists.count
        } else {
            return loadingLists.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableViewCell.reuseIdentifier, for: indexPath) as? RankingTableViewCell else {
                return UITableViewCell()
            }
//            cell.set(team: teamLists[indexPath.row])
            cell.set(presentable: filterLists[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.reuseIdentifier, for: indexPath) as? LoadingTableViewCell else { return UITableViewCell() }
            cell.startAnimation()
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 70 : 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.tappedRankItem()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let _ = cell as? LoadingTableViewCell, indexPath.section == 1 else { return }
        presenter?.continuePagination()
    }
}


extension Rank: FilterSettingDelegate {
    func didFinishedSelectionSetting(filterName: String) {
        print("FilterName is \(filterName)")
    }
}
