//
//  Sponsor.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import UIKit

class Sponsor: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var sponsorLists: [SponsorModel] = []
    
    var presenter: SponsorPresenting?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
        
        presenter?.viewDidLoad()
    }
    

    private func configureHierarchy() {
        configureContainerView()
        configureCollectionView()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.inputColor
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: String(describing: SponsorCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: SponsorCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(130))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let compositionLayout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = compositionLayout
        collectionView.backgroundColor = UIColor.clear
    }

}

extension Sponsor: SponsorViewDelegate {
    func updateUI(sponsorLists: [SponsorModel]) {
        self.sponsorLists = sponsorLists
        self.collectionView.reloadData()
    }
}

extension Sponsor: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sponsorLists.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SponsorCollectionViewCell.reuseIdentifier, for: indexPath) as? SponsorCollectionViewCell else { return UICollectionViewCell() }
        cell.updateUI(sponsorModel: sponsorLists[indexPath.row])
        return cell
    }
}
