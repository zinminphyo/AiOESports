//
//  OverviewCellWithMultipleImages.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 14/04/2023.
//

import UIKit

class OverviewCellWithMultipleImages: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var signatureLists: [SignatureModel] = []
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureHierarchy()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureHierarchy() {
        configureContainerView()
        configureTitleLabel()
        configureCollectionView()
    }
    
    private func configureContainerView() {
        self.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureTitleLabel() {
        titleLabel.font = Fonts.subtitleFont
        titleLabel.textColor = Colors.Text.secondaryText
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: String(describing: OverviewImageCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: OverviewImageCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: collectionView.frame.height * 1.4, height: collectionView.frame.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 4
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = UIColor.clear
    }
    
    func renderUI(title: String, signatureLists: [SignatureModel]) {
        titleLabel.text = title
        self.signatureLists = signatureLists
        self.collectionView.reloadData()
    }
}



//MARK: - UICollection View Data Source
extension OverviewCellWithMultipleImages: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return signatureLists.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OverviewImageCollectionViewCell.reuseIdentifier, for: indexPath) as? OverviewImageCollectionViewCell else { return UICollectionViewCell() }
        cell.renderUI(url: signatureLists[indexPath.row].signatureImageFullPath)
        return cell
    }
}
