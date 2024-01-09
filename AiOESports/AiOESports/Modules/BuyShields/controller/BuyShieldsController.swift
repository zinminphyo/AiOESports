//
//  BuyShieldsController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 07/01/2024.
//

import UIKit

class BuyShieldsController: UIViewController {
    
    @IBOutlet private(set) var bankLists: UICollectionView!
    @IBOutlet private(set) var accountLists: UITableView!
    @IBOutlet private(set) var accountListsHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureBankLists()
        configureAccountLists()
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
    

   @IBAction
    private func didTapBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}



extension BuyShieldsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BankAccountCell.reuseIdentifier, for: indexPath) as! BankAccountCell
        return cell
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
