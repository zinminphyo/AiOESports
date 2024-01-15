//
//  MoreOfferController.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 15/01/2024.
//

import UIKit
import Combine

class MoreOfferController: UIViewController {
    
    @IBOutlet private(set) var shieldLists: UICollectionView!
    @IBOutlet private(set) var loadingView: UIView!
    
    private let vm: MoreOfferViewModel!
    private(set) var subscription = Set<AnyCancellable>()
    
    private var lists: [BuyShieldsResponse.ShieldAmount] = []
    
    init() {
        vm = MoreOfferViewModel()
        super.init(nibName: "MoreOfferController", bundle: nil)
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
        configureShieldLists()
        configureViewModel()
    }
    
    private func configureShieldLists() {
        shieldLists.register(UINib(nibName: String(describing: ShieldAmountCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: ShieldAmountCollectionViewCell.reuseIdentifier)
        shieldLists.dataSource = self
        shieldLists.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        shieldLists.collectionViewLayout = layout
        shieldLists.showsVerticalScrollIndicator = false
        shieldLists.showsHorizontalScrollIndicator = false
        shieldLists.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    private func configureViewModel() {
        vm.fetchingCompleted
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.lists = $0
                self?.shieldLists.reloadData()
            }.store(in: &subscription)
        
        vm.$isFetching
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.loadingView.isHidden = !$0
            }.store(in: &subscription)
        
        vm.fetchShieldLists()
    }

    @IBAction
    private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}


extension MoreOfferController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShieldAmountCollectionViewCell.reuseIdentifier, for: indexPath) as! ShieldAmountCollectionViewCell
        cell.render(shield: lists[indexPath.row])
        return cell
    }
}


extension MoreOfferController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 26) / 2
        return CGSize(width: width, height: width + 30)
    }
}
