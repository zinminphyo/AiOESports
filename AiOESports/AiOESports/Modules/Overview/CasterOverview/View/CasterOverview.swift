//
//  CasterOverview.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import UIKit

class CasterOverview: UIViewController {
    
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet private(set) var socialViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    private var socialLists: [SocialModel] = []
    private var details: CasterDetails! = nil

    var presenter: CasterOverviewPresenting?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
        
        presenter?.viewDidLoad()
    }
    

    private func configureHierarchy() {
        self.view.backgroundColor = Colors.Theme.inputColor
        configureContentContainerView()
        configureColletionView()
        configureTableView()
    }
    
    private func configureContentContainerView() {
        contentContainerView.backgroundColor = UIColor.clear
    }
    
    private func configureColletionView() {
        collectionView.register(UINib(nibName: String(describing: SocialCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: SocialCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = SizeInspector.socialIconSize
        flowLayout.scrollDirection = .horizontal
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = UIColor.clear
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: OverviewTableViewCell.self), bundle: nil), forCellReuseIdentifier: OverviewTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: String(describing: GameImagesTableViewCell.self), bundle: nil), forCellReuseIdentifier: GameImagesTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
    }

}


extension CasterOverview: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialLists.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialCollectionViewCell.reuseIdentifier, for: indexPath) as? SocialCollectionViewCell else { return UICollectionViewCell() }
        cell.renderUI(social: socialLists[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didTapSocial(social: socialLists[indexPath.row])
    }
}


extension CasterOverview: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GameImagesTableViewCell.reuseIdentifier, for: indexPath) as? GameImagesTableViewCell else { return UITableViewCell() }
            cell.renderUI(title: "Games", mainGame: details.mainGame, subGames: details.subGames)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OverviewTableViewCell.reuseIdentifier, for: indexPath) as? OverviewTableViewCell else { return UITableViewCell()}
        switch indexPath.row {
        case 0:
            cell.render(title: "Status", value: details?.details.status.capitalized ?? "", imageURL: nil)
        case 1:
            cell.render(title: "Real Name", value: details?.details.fullName ?? "", imageURL: nil)
        case 2:
            cell.render(title: "Birthday", value: details?.details.birthday ?? "", imageURL: nil)
        case 3:
            cell.render(title: "Location", value: details?.details.city ?? "", imageURL: details?.details.locationImageFullPath)
        case 4:
            cell.render(title: "Role", value: details?.details.role ?? "", imageURL: nil)
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}


extension CasterOverview: CasterOverviewViewDelegate {
    func renderUI(details: CasterDetails) {
        socialLists = details.social
        collectionView.reloadData()
        collectionView.invalidateIntrinsicContentSize()
        socialViewWidthConstraint.constant = collectionView.collectionViewLayout.collectionViewContentSize.width
        self.details = details
        tableView.reloadData()
    }
}
