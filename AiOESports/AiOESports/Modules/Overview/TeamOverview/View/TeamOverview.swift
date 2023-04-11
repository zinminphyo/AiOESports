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
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 50, height: 50)
        flowLayout.scrollDirection = .horizontal
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = UIColor.clear
    }
    
    private func configureTeamStatusView() {
        statusLabel.text = "Status"
        statusLabel.textColor = Colors.Text.secondaryText
        statusLabel.font = Fonts.ForCell.subtitleFont
        
        statusValueLabel.textColor = Colors.Text.primaryText
        statusValueLabel.font = Fonts.ForCell.subtitleFont
    }
    
    private func configureTeamFullNameView() {
        fullNameLabel.text = "Full Name"
        fullNameLabel.font = Fonts.ForCell.subtitleFont
        fullNameLabel.textColor = Colors.Text.secondaryText
        
        fullNameValueLabel.textColor = Colors.Text.primaryText
        fullNameValueLabel.font = Fonts.ForCell.subtitleFont
    }
    
    private func configureFoundedDateView() {
        foundedDateLabel.text = "Founded Date"
        foundedDateLabel.font = Fonts.ForCell.subtitleFont
        foundedDateLabel.textColor = Colors.Text.secondaryText
        
        foundedDateValueLabel.textColor = Colors.Text.primaryText
        foundedDateValueLabel.font = Fonts.ForCell.subtitleFont
    }
    
    private func configureLocationView() {
        locationLabel.text = "Location"
        locationLabel.font = Fonts.ForCell.subtitleFont
        locationLabel.textColor = Colors.Text.secondaryText
        
        loationImageView.contentMode = .scaleAspectFit
        cityNameLabel.textColor = Colors.Text.primaryText
        cityNameLabel.font = Fonts.ForCell.subtitleFont
    }

}


extension TeamOverview: TeamOverviewViewDelegate {
    func updateUI(details: TeamDetailsModel, social: [SocialModel]) {
        self.socialLists = social
        self.collectionView.reloadData()
        
        statusValueLabel.text = details.status
        fullNameValueLabel.text = details.fullName
        foundedDateValueLabel.text = details.foundedDate
        cityNameLabel.text = details.city
        loationImageView.kf.setImage(with: URL(string: details.locationImageFullPath))
    }
}


extension TeamOverview: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialLists.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SocialCollectionViewCell.reuseIdentifier, for: indexPath) as? SocialCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
