//
//  TeamOverview.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 11/04/2023.
//

import UIKit
import Kingfisher

class TeamOverview: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var socialViewWidth: NSLayoutConstraint!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusValueLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var fullNameValueLabel: UILabel!
    @IBOutlet weak var foundedDateLabel: UILabel!
    @IBOutlet weak var foundedDateValueLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var loationImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    var presenter: TeamOverviewPresenting?

    private var socialLists: [SocialModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
        
        presenter?.viewDidLoad()
    }
    
    private func configureHierarchy() {
        configureContainerView()
        configureSocialCollectionView()
        configureTeamStatusView()
        configureTeamFullNameView()
        configureFoundedDateView()
        configureLocationView()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.inputColor
    }
    
    private func configureSocialCollectionView() {
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
    
    private func configureTeamStatusView() {
        statusLabel.text = "Status"
        statusLabel.textColor = Colors.Text.secondaryText
//        statusLabel.font = Fonts.ForCell.subtitleFont
        
        statusValueLabel.textColor = Colors.Text.primaryText
//        statusValueLabel.font = Fonts.ForCell.subtitleFont
    }
    
    private func configureTeamFullNameView() {
        fullNameLabel.text = "Full Name"
//        fullNameLabel.font = Fonts.ForCell.subtitleFont
        fullNameLabel.textColor = Colors.Text.secondaryText
        
        fullNameValueLabel.textColor = Colors.Text.primaryText
//        fullNameValueLabel.font = Fonts.ForCell.subtitleFont
    }
    
    private func configureFoundedDateView() {
        foundedDateLabel.text = "Founded Date"
//        foundedDateLabel.font = Fonts.ForCell.subtitleFont
        foundedDateLabel.textColor = Colors.Text.secondaryText
        
        foundedDateValueLabel.textColor = Colors.Text.primaryText
//        foundedDateValueLabel.font = Fonts.ForCell.subtitleFont
    }
    
    private func configureLocationView() {
        locationLabel.text = "Location"
//        locationLabel.font = Fonts.ForCell.subtitleFont
        locationLabel.textColor = Colors.Text.secondaryText
        
        loationImageView.contentMode = .scaleAspectFit
        cityNameLabel.textColor = Colors.Text.primaryText
//        cityNameLabel.font = Fonts.ForCell.subtitleFont
    }

}


extension TeamOverview: TeamOverviewViewDelegate {
    func updateUI(details: TeamDetailsModel, social: [SocialModel]) {
        socialLists = social
        collectionView.reloadData()
        collectionView.invalidateIntrinsicContentSize()
        socialViewWidth.constant = collectionView.collectionViewLayout.collectionViewContentSize.width
        
        statusValueLabel.text = details.status.capitalized
        fullNameValueLabel.text = details.fullName.capitalized
        foundedDateValueLabel.text = details.foundedDate
        cityNameLabel.text = details.city.capitalized
        loationImageView.kf.setImage(with: URL(string: details.locationImageFullPath))
    }
}


extension TeamOverview: UICollectionViewDataSource, UICollectionViewDelegate {
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
