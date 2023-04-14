//
//  PlayerOverview.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import UIKit

class PlayerOverview: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: PlayerOverviewPresenting?
    
    private var socialLists: [SocialModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
        
        presenter?.viewDidLoad()
        
    }
    
    private func configureHierarchy() {
        configureContainerView()
        configureCollectionView()
        configureTableView()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: String(describing: SocialCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: SocialCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: 100, height: collectionView.frame.height)
        flowLayout.scrollDirection = .horizontal
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = UIColor.clear
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: OverviewTableViewCell.self), bundle: nil), forCellReuseIdentifier: OverviewTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: String(describing: OverviewCellWithMultipleImages.self), bundle: nil), forCellReuseIdentifier: OverviewCellWithMultipleImages.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
    }

}

extension PlayerOverview: PlayerOverviewViewDelegate {
    func renderDetails(details: PlayerDetailsModel, social: [SocialModel]) {
        self.socialLists = social
        self.collectionView.reloadData()
    }
}

extension PlayerOverview: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialLists.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialCollectionViewCell.reuseIdentifier, for: indexPath) as? SocialCollectionViewCell else { return UICollectionViewCell() }
        cell.renderUI(social: socialLists[indexPath.row])
        return cell
    }
}


extension PlayerOverview: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OverviewCellWithMultipleImages.reuseIdentifier, for: indexPath) as? OverviewCellWithMultipleImages else { return UITableViewCell() }
            cell.renderUI(title: "Signature", signatureLists: presenter?.getSignatureLists() ?? [])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OverviewTableViewCell.reuseIdentifier, for: indexPath) as? OverviewTableViewCell else { return UITableViewCell() }
            cell.render(title: presenter?.getTitleForCell(at: indexPath.row) ?? "", value: presenter?.getValueForCell(at: indexPath.row) ?? "", imageURL: presenter?.getImageURLForCell(at: indexPath.row))
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
