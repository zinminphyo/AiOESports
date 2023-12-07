//
//  Rank.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/04/2023.
//

import UIKit
//import SVProgressHUD
import Kingfisher
import Combine

class Rank: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var gameCategoryCollectionView: UICollectionView!
    @IBOutlet private(set) var loadingView: LoadingView!
    @IBOutlet private(set) var teamRankView: RankListsView!
    @IBOutlet private(set) var playerRankView: RankListsView!
    @IBOutlet private(set) var casterRankView: RankListsView!
    @IBOutlet private(set) var creatorRankView: RankListsView!
    
    var presenter: RankPresenter?
    
    private(set) var subscription = Set<AnyCancellable>()
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
        
        
        
        presenter?.$teamRankLists
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                let lists = $0.compactMap{ RankListsView.RankModel(team: $0) }
                self.teamRankView.lists = lists
            }).store(in: &subscription)
        
        presenter?.$teamCoverImage
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.teamRankView.coverImage = $0
            }).store(in: &subscription)
        
        presenter?.$loadingLists
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.teamRankView.hasMore = $0.count > 0
            }).store(in: &subscription)
        
        presenter?.$gameType
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.teamRankView.gameType = $0
            }).store(in: &subscription)
        
        presenter?.$playerRankLists
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                let lists = $0.compactMap{ RankListsView.RankModel(player: $0) }
                self.playerRankView.lists = lists
            }).store(in: &subscription)
        
        presenter?.$playerLoadingLists
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.playerRankView.hasMore = $0.count > 0
            }).store(in: &subscription)
        
        presenter?.$casterLists
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                let lists = $0.compactMap{ RankListsView.RankModel(caster: $0) }
                self.casterRankView.lists = lists
            }).store(in: &subscription)
        
        presenter?.$casterLoadingLists
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.casterRankView.hasMore = $0.count > 0
            }).store(in: &subscription)
        
        presenter?.$creatorLists
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                let lists = $0.compactMap{ RankListsView.RankModel(creator: $0) }
                self.creatorRankView.lists = lists
            }).store(in: &subscription)
        
        presenter?.$creatorLoadingLists
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.creatorRankView.hasMore = $0.count > 1
            }).store(in: &subscription)
        
        presenter?.$rankCategory
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] category in
                guard let self = self else { return }
                UIView.animate(withDuration: 0.3, delay: 0.0, options: .transitionCrossDissolve, animations: {
                    self.teamRankView.alpha = category != .team ? 0.0 : 1.0
                    self.playerRankView.alpha = category != .player ? 0.0 : 1.0
                    self.casterRankView.alpha = category != .caster ? 0.0 : 1.0
                    self.creatorRankView.alpha = category != .creator ? 0.0 : 1.0
                }, completion: nil)
            }).store(in: &subscription)
        
        presenter?.$playerCoverImage
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.playerRankView.coverImage = $0
            }).store(in: &subscription)
        
        presenter?.$casterCoverImage
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.casterRankView.coverImage = $0
            }).store(in: &subscription)
        
        presenter?.$creatorCoverImage
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.creatorRankView.coverImage = $0
            }).store(in: &subscription)
        
        presenter?.fetchTeamLists(gameType: .All, status: .all)
        
        presenter?.fetchPlayerLists(gameType: .All, status: .active)
        presenter?.fetchCasterLists(gameType: .All, status: .all)
        presenter?.fetchCreatorLists(gameType: .All, status: .all)
    }
    
    private func configureHierarchy() {
        configureHeaderView()
        configureCategoryCollectionView()
        configureGameCategoryCollectionView()
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
    
    
    
    @IBAction func didTapSearchBtn(_ sender: UIButton) {
        presenter?.tappedSearchBtn()
    }
    
    @IBAction func didTapFilterBtn(_ sender: UIButton) {
        presenter?.tappedFilerSettingBtn()
    }
    
    @IBAction
    private func didTriggerPaginationInTeam(_ sender: RankListsView) {
        presenter?.continuePagination()
    }
    
    
    @IBAction
    private func didTriggerPaginationInPlayer(_ sender: RankListsView) {
        presenter?.continuePagination()
    }
    
    @IBAction
    private func didTriggerPaginationInCaster(_ sender: RankListsView) {
        presenter?.continuePagination()
    }
    
    @IBAction
    private func didTriggerPaginationInCreator(_ sender: RankListsView) {
        presenter?.continuePagination()
    }
    
    @IBAction
    private func didTapToViewTeamDetails(_ sender: RankListsView) {
        guard let id = sender.selectedId else { return }
        guard let vc = DetailsModuel.createModule(category: .team, id: id) else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapToViewPlayerDetails(_ sender: RankListsView) {
        guard let id = sender.selectedId else { return }
        guard let vc = DetailsModuel.createModule(category: .player, id: id) else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapToViewCasterDetails(_ sender: RankListsView) {
        guard let id = sender.selectedId else { return }
        guard let vc = DetailsModuel.createModule(category: .caster, id: id) else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapToViewCreatorDetails(_ sender: RankListsView) {
        guard let id = sender.selectedId else { return }
        guard let vc = DetailsModuel.createModule(category: .creator, id: id) else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - View Delegate
extension Rank: RankViewDelegate {
    
    func renderTeamLists(teamLists: [TeamObject]) {}
    
    func renderPlayerLists(playerLists: [PlayerObject]) {}
    
    func renderLoadingLists(loadingLists: [String]) {}
    
    func renderRankLists(lists: [RankPresentable]) {}
    
    func renderCoverImage(url: String) {}
    
    func renderError(error: String) {}
    
    func showLoading() {
        loadingView.showLoading()
    }
    
    func hideLoading() {
        loadingView.hideLoading()
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



extension Rank: FilterSettingDelegate {
    func didFinishedSelectionSetting(filterName: String) {
        print("FilterName is \(filterName)")
    }
}


