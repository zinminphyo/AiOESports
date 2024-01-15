//
//  CommentListsController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import UIKit
import Combine

class CommentListsController: UIViewController {
    
    @IBOutlet private(set) var starCountFilter: UICollectionView!
    @IBOutlet private(set) var commentListsView: UITableView!
    
    private let vm: CommentListsViewModel!
    private(set) var subscription = Set<AnyCancellable>()
    
    init() {
        vm = CommentListsViewModel()
        super.init(nibName: "CommentListsController", bundle: nil)
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
        configureFilterView()
        configureCommentListsView()
        configureViewModel()
    }
    
    private func configureCommentListsView() {
        commentListsView.register(UINib(nibName: String(describing: CommentTableViewCell.self), bundle: nil), forCellReuseIdentifier: CommentTableViewCell.reuseIdentifier)
        commentListsView.separatorStyle = .none
        commentListsView.dataSource = self
        commentListsView.delegate = self
    }
    
    private func configureViewModel() {
        vm.$selectedIndex
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.starCountFilter.reloadData()
            }.store(in: &subscription)
    }
    
    private func configureFilterView() {
        starCountFilter.register(UINib(nibName: String(describing: StarCountFilterCell.self), bundle: nil), forCellWithReuseIdentifier: StarCountFilterCell.reuseIdenfier)
        starCountFilter.dataSource = self
        starCountFilter.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: 100, height: 50)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        starCountFilter.collectionViewLayout = flowLayout
        starCountFilter.showsHorizontalScrollIndicator = false
        starCountFilter.contentInset = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
    }
    
    @IBAction
    private func didTapDismiss(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}


extension CommentListsController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.filterLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StarCountFilterCell.reuseIdenfier, for: indexPath) as! StarCountFilterCell
        cell.render(name: vm.filterLists[indexPath.row].rawValue)
            .render(isSelected: vm.selectedIndex == indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        vm.selectedIndex = indexPath.row
    }
}



extension CommentListsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.reuseIdentifier, for: indexPath) as! CommentTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
