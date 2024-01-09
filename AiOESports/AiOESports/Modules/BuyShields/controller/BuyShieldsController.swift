//
//  BuyShieldsController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 07/01/2024.
//

import UIKit
import Combine


class BuyShieldsController: UIViewController {
    
    @IBOutlet private(set) var bankLists: UICollectionView!
    @IBOutlet private(set) var accountLists: UITableView!
    @IBOutlet private(set) var accountListsHeight: NSLayoutConstraint!
    
    
    private let vm: BuyShieldsViewModel!
    private var subscription = Set<AnyCancellable>()
    
    init() {
        vm = BuyShieldsViewModel()
        super.init(nibName: "BuyShieldsController", bundle: nil)
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
        configureBankLists()
        configureAccountLists()
        configureViewModel()
        configureViewModel()
    }
    
    private func configureBankLists() {
        bankLists.register(UINib(nibName: String(describing: BankAccountCell.self), bundle: nil), forCellWithReuseIdentifier: BankAccountCell.reuseIdentifier)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 77, height: 107)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        bankLists.collectionViewLayout = layout
        bankLists.dataSource = self
        bankLists.delegate = self
        bankLists.showsHorizontalScrollIndicator = false
        bankLists.contentInset = UIEdgeInsets(top: 4, left: 8, bottom: -4, right: 0)
    }
    
    private func configureAccountLists() {
        accountLists.register(UINib(nibName: String(describing: AccountCell.self), bundle: nil), forCellReuseIdentifier: AccountCell.reuseIdentifier)
        accountLists.separatorStyle = .none
        accountLists.dataSource = self
        accountLists.delegate = self
        accountListsHeight.constant = 70 * 3
        view.invalidateIntrinsicContentSize()
    }
    
    private func configureViewModel() {
        vm.$selectedIndex
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.bankLists.reloadData()
            }.store(in: &subscription)
    }
    
    
   @IBAction
    private func didTapBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}



extension BuyShieldsController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BankAccountCell.reuseIdentifier, for: indexPath) as! BankAccountCell
        cell.render(isSelected: indexPath.row == vm.selectedIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        vm.selectedIndex = indexPath.row
    }
}


extension BuyShieldsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountCell.reuseIdentifier, for: indexPath) as! AccountCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
