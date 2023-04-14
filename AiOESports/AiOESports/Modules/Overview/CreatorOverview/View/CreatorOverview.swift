//
//  CreatorOverview.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import UIKit

class CreatorOverview: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var seperatorView: UIView!
    @IBOutlet weak var bioTitleLabel: UILabel!
    @IBOutlet weak var bioValueLabel: UILabel!
    
    private var socialLists: [SocialModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureContainerView()
        configureContentContainerView()
        configureCollectionView()
        configureTableView()
        configureSeperatorView()
        configureBioView()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureContentContainerView() {
        contentContainerView.backgroundColor = UIColor.clear
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: String(describing: SocialCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: SocialCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
        flowLayout.scrollDirection = .horizontal
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = UIColor.clear
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: OverviewTableViewCell.self), bundle: nil), forCellReuseIdentifier: OverviewTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
    }
    
    private func configureSeperatorView() {
        seperatorView.backgroundColor = Colors.Theme.inputColor
    }
    
    private func configureBioView() {
        bioTitleLabel.font = Fonts.titleFont
        bioTitleLabel.textColor = Colors.Text.primaryText
        
        bioValueLabel.font = Fonts.subtitleFont
        bioValueLabel.textColor = Colors.Text.primaryText
    }

    

}


extension CreatorOverview: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialLists.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialCollectionViewCell.reuseIdentifier, for: indexPath) as? SocialCollectionViewCell else { return UICollectionViewCell() }
        cell.renderUI(social: socialLists[indexPath.row])
        return cell
    }
}


extension CreatorOverview: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OverviewTableViewCell.reuseIdentifier, for: indexPath) as? OverviewTableViewCell else { return UITableViewCell() }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
