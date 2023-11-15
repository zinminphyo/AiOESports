//
//  Rank.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import UIKit
//import SVProgressHUD
import Kingfisher

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
        gameCategoryCollectionView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: gameCategoryCollectionView.frame.height, height: gameCategoryCollectionView.frame.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        gameCategoryCollectionView.allowsMultipleSelection = false
        gameCategoryCollectionView.collectionViewLayout = flowLayout
        gameCategoryCollectionView.showsVerticalScrollIndicator = false
        gameCategoryCollectionView.showsHorizontalScrollIndicator = false
        gameCategoryCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
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
        self.teamLists = teamLists
        self.tableView.reloadSections([0], with: .fade)
    }
    
    func renderPlayerLists(playerLists: [PlayerObject]) {
        self.filterLists = playerLists
        self.tableView.reloadSections([0], with: .fade)
    }
    
    func renderLoadingLists(loadingLists: [String]) {
        /*
        var toDeleteIndexPaths: [IndexPath] = []
        self.loadingLists.indices.forEach{
            toDeleteIndexPaths.append(IndexPath(row: $0, section: 1))
        }
        self.loadingLists.removeAll()
        self.tableView.deleteRows(at: toDeleteIndexPaths, with: .automatic)
        
        var toInsertIndexPaths: [IndexPath] = []
        loadingLists.indices.forEach{
            toInsertIndexPaths.append(IndexPath(row: $0, section: 1))
        }
        
        self.loadingLists = loadingLists
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: toInsertIndexPaths, with: .automatic)
        self.tableView.endUpdates()
         */
        self.loadingLists = loadingLists
        self.tableView.reloadData()
    }
    
    func renderRankLists(lists: [RankPresentable]) {
        /*
        var toDeleteIndexPaths: [IndexPath] = []
        filterLists.indices.forEach {
            toDeleteIndexPaths.append(IndexPath(row: $0, section: 0))
        }
        filterLists.removeAll()
        self.tableView.deleteRows(at: toDeleteIndexPaths, with: .automatic)
        
        var toInsertIndexPaths: [IndexPath] = []
        lists.indices.forEach{
            toInsertIndexPaths.append(IndexPath(row: $0, section: 0))
        }
        self.filterLists = lists
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: toInsertIndexPaths, with: .automatic)
        self.tableView.endUpdates()
         */
        self.filterLists = lists
        self.tableView.reloadSections([0], with: .none)
    }
    
    func renderCoverImage(url: String) {
        tableView.tableHeaderView = createTableHeaderView(url: url)
    }
    
    func renderError(error: String) {
        
    }
    
    func showLoading() {
//        SVProgressHUD.show()
    }
    
    func hideLoading() {
//        SVProgressHUD.dismiss()
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
            cell.set(image: GameType.allCases[indexPath.row].unselectedStateImage)
            if let selectedIndexPath = gameCategoryCollectionView.indexPathsForSelectedItems?.last, let cell = gameCategoryCollectionView.cellForItem(at: selectedIndexPath) as? GameCategoryCollectionViewCell {
                cell.set(image: GameType.allCases[selectedIndexPath.row].selectedStateImage)
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == gameCategoryCollectionView {
            guard let cell = collectionView.cellForItem(at: indexPath) as? GameCategoryCollectionViewCell else { return }
            cell.set(image: GameType.allCases[indexPath.row].selectedStateImage)
            presenter?.changedGameType(game: GameType.allCases[indexPath.row])
        }
        guard collectionView == categoryCollectionView else { return }
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell else { return }
        cell.set(isSelected: true)
        presenter?.changedRankCategory(category: RankCategory.allCases[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == gameCategoryCollectionView {
            guard let cell = collectionView.cellForItem(at: indexPath) as? GameCategoryCollectionViewCell else { return }
            cell.set(image: GameType.allCases[indexPath.row].unselectedStateImage)
        }
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
        presenter?.tappedRankItem(id: self.filterLists[indexPath.row].getId())
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


extension Rank {
    private func createTableHeaderView(url: String) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.width * 0.5))
        view.backgroundColor = UIColor.clear
        let imgView = UIImageView(frame: .zero)
        imgView.kf.setImage(with: URL(string: url), placeholder: Images.Placeholder.cover)
        view.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imgView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        return view
    }
}
