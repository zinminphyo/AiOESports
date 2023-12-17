//
//  PlayerRankController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 16/12/2023.
//

import UIKit
import Combine

class PlayerRankController: UIViewController {
    
    @IBOutlet private(set) var gamesCollectionView: UICollectionView!
    @IBOutlet private(set) var rankListView: RankListsView!
    
    private let vm: PlayerRankViewModel!
    private(set) var subscription = Set<AnyCancellable>()
    
    init() {
        vm = PlayerRankViewModel()
        super.init(nibName: "PlayerRankController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    
    
    
    
    private func configureHierarchy() {
        
        configureGameCollection()
        configureRankListView()
        configureViewModel()
    }
    
    private func configureViewModel() {
        vm.$isFetching
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else {return }
                print("Is Fetching is \($0)")
            }.store(in: &subscription)
        
        vm.$hasMore
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else {return }
                self.rankListView.hasMore = $0
            }.store(in: &subscription)
        
        vm.$lists
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  in
                guard let self = self else { return }
                self.rankListView.lists = $0.compactMap{ .init(player: $0) }
            }.store(in: &subscription)
        
        vm.$gameType
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.rankListView.gameType = $0
            }.store(in: &subscription)
        
        vm.fetchLists()
    }
    
    private func configureGameCollection() {
        gamesCollectionView.register(GameCategoryCollectionViewCell.self, forCellWithReuseIdentifier: GameCategoryCollectionViewCell.reuseIdentifier)
        gamesCollectionView.dataSource = self
        gamesCollectionView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: gamesCollectionView.frame.height, height: gamesCollectionView.frame.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        gamesCollectionView.allowsMultipleSelection = false
        gamesCollectionView.collectionViewLayout = flowLayout
        gamesCollectionView.showsVerticalScrollIndicator = false
        gamesCollectionView.showsHorizontalScrollIndicator = false
        gamesCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    private func configureRankListView() {
        rankListView.addTarget(self, action: #selector(didTriggerPagination), for: .valueChanged)
    }
    
    @objc func didTriggerPagination() {
        vm.continuePagination()
    }


}


extension PlayerRankController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GameType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? GameCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.set(image: GameType.allCases[indexPath.row].unselectedStateImage)
        if let selectedIndexPath = gamesCollectionView.indexPathsForSelectedItems?.last, let cell = gamesCollectionView.cellForItem(at: selectedIndexPath) as? GameCategoryCollectionViewCell {
            cell.set(image: GameType.allCases[selectedIndexPath.row].selectedStateImage)
        }
        return cell
    }
}

extension PlayerRankController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GameCategoryCollectionViewCell else { return }
        cell.set(image: GameType.allCases[indexPath.row].selectedStateImage)
//        presenter?.changedGameType(game: GameType.allCases[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GameCategoryCollectionViewCell else { return }
        cell.set(image: GameType.allCases[indexPath.row].unselectedStateImage)
    }
}
