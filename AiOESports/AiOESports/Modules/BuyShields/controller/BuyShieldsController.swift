//
//  BuyShieldsController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 07/01/2024.
//

import UIKit
import Combine


class BuyShieldsController: UIViewController {
    
    @IBOutlet private(set) var shieldAmountListsView: UICollectionView!
    @IBOutlet private(set) var bankLists: UICollectionView!
    @IBOutlet private(set) var accountLists: UITableView!
    @IBOutlet private(set) var accountListsHeight: NSLayoutConstraint!
    @IBOutlet private(set) var phoneNumber1Label: UILabel!
    @IBOutlet private(set) var phoneNumber2Label: UILabel!
    
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
        configureShieldAmountListsView()
        configureBankLists()
        configureAccountLists()
        configureViewModel()
        configureViewModel()
    }
    
    private func configureShieldAmountListsView() {
        shieldAmountListsView.register(UINib(nibName: String(describing: ShieldAmountCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: ShieldAmountCollectionViewCell.reuseIdentifier)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 170)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        shieldAmountListsView.collectionViewLayout = layout
        shieldAmountListsView.dataSource = self
        shieldAmountListsView.showsHorizontalScrollIndicator = false
        shieldAmountListsView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    private func configureBankLists() {
        bankLists.register(UINib(nibName: String(describing: BankAccountCell.self), bundle: nil), forCellWithReuseIdentifier: BankAccountCell.reuseIdentifier)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 77, height: 77)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        bankLists.collectionViewLayout = layout
        bankLists.dataSource = self
        bankLists.delegate = self
        bankLists.showsHorizontalScrollIndicator = false
        bankLists.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    private func configureAccountLists() {
        accountLists.register(UINib(nibName: String(describing: AccountCell.self), bundle: nil), forCellReuseIdentifier: AccountCell.reuseIdentifier)
        accountLists.separatorStyle = .none
        accountLists.dataSource = self
        accountLists.delegate = self
        accountLists.isScrollEnabled = false
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
        
        vm.fetchingListsCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.updateUI()
            }.store(in: &subscription)
        
        vm.fetchShieldLists()
    }
    
    
    private func updateUI() {
        accountListsHeight.constant = CGFloat(max(100, 70 * vm.accountLists.count))
        view.invalidateIntrinsicContentSize()
        accountLists.reloadData()
        bankLists.reloadData()
        shieldAmountListsView.reloadData()
        phoneNumber1Label.text = vm.phoneNumber1
        phoneNumber2Label.text = vm.phoneNumber2
    }
    
    
   @IBAction
    private func didTapBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction
    private func didTapPhNum1(_ sender: UIButton) {
        guard let url = URL(string: "tel://\(vm.phoneNumber1)") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction
    private func didTapPhNum2(_ sender: UIButton) {
        guard let url = URL(string: "tel://\(vm.phoneNumber2)") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction
    private func didTapTelegram(_ sender: UIButton) {
        guard let url = URL(string: "tg://\(vm.telegram)") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction
    private func didTapViber(_ sender: UIButton) {
        guard let url = URL(string: "viber://add?number=\(vm.viber)") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction
    private func didTapMessenger(_ sender: UIButton) {
        guard let url = URL(string: vm.messenger) else { return }
        UIApplication.shared.open(url)
    }

}



extension BuyShieldsController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionView == bankLists ? vm.bankLists.count : vm.shieldHistories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == shieldAmountListsView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShieldAmountCollectionViewCell.reuseIdentifier, for: indexPath) as! ShieldAmountCollectionViewCell
            cell.render(shield: vm.shieldHistories[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BankAccountCell.reuseIdentifier, for: indexPath) as! BankAccountCell
            cell.render(isSelected: indexPath.row == vm.selectedIndex)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        vm.selectedIndex = indexPath.row
    }
}


extension BuyShieldsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.accountLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountCell.reuseIdentifier, for: indexPath) as! AccountCell
        cell.render(vm.accountLists[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
