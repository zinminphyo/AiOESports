//
//  Details.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit
import Kingfisher

class Details: UIViewController {
    
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var colletionView: UICollectionView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var teamInfoContainerView: UIView!
    @IBOutlet weak var locationCOntainerView: UIView!
    @IBOutlet weak var detailsInfoContainerView: UIView!
    
    @IBAction func didTapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var presenter: DetailsPresenting?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
        
        presenter?.fetchDetails()
    }
    

    private func configureHierarchy() {
        configureContainerView()
        configureContainerScrollView()
        configureCoverImageView()
        configureTeamInfoContainerView()
        configureCoverImageView()
        configureTeamImageView()
        configureTeamNameLabel()
        configureLocationContainerView()
        configureCityLabel()
        configureDetailsInfoContainerView()
        configureCollectionView()
        configureContentScrollView()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureContainerScrollView() {
        self.containerScrollView.showsVerticalScrollIndicator = false
        self.containerScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.backgroundColor = UIColor.clear
    }
    
    private func configureCoverImageView() {
        coverImageView.contentMode = .scaleAspectFill
    }
    
    private func configureTeamInfoContainerView() {
        teamInfoContainerView.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureTeamNameLabel() {
        teamNameLabel.textColor = Colors.Text.primaryText
        teamNameLabel.font = Fonts.titleFont
    }
    
    private func configureTeamImageView() {
        teamImageView.contentMode = .scaleAspectFit
        teamImageView.layer.cornerRadius = 8
    }
    
    private func configureCityLabel() {
        cityNameLabel.textColor = Colors.Text.primaryText
        cityNameLabel.font = Fonts.subtitleFont
    }
    
    private func configureLocationContainerView() {
        locationCOntainerView.layer.cornerRadius = 5
        locationCOntainerView.backgroundColor = Colors.Theme.SecondaryBackground
    }
    
    private func configureDetailsInfoContainerView() {
        detailsInfoContainerView.clipsToBounds = true
        detailsInfoContainerView.layer.cornerRadius = 20
        detailsInfoContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func configureCollectionView() {
        colletionView.register(UINib(nibName: String(describing: DetailsContentCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: DetailsContentCollectionViewCell.reuseIdentifier)
        colletionView.dataSource = self
        colletionView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = CGSize(width: 200, height: colletionView.frame.height)
        colletionView.showsVerticalScrollIndicator = false
        colletionView.showsHorizontalScrollIndicator = false
        colletionView.collectionViewLayout = flowLayout
        colletionView.backgroundColor = Colors.Theme.inputColor
        colletionView.allowsMultipleSelection = false
        
    }
    
    private func configureContentScrollView() {
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.showsVerticalScrollIndicator = false
        contentScrollView.isPagingEnabled = true
        contentScrollView.bounces = false
        contentScrollView.backgroundColor = UIColor.clear
        contentScrollView.delegate = self
    }
    
    private func updateContainerView(details: TeamDetails) {
        let iRange = TeamDetailsContent.allCases.count
        var x: CGFloat = 0
        for i in 0..<iRange {
            x = CGFloat(i) * contentScrollView.frame.width
            guard let vc = presenter?.getContentView(for: .team, at: i) else { return }
            let contentView = vc.view ?? UIView(frame: .zero)
            contentView.frame = CGRect(x: x, y: 0, width: contentScrollView.frame.width, height: contentScrollView.frame.height)
            
            vc.willMove(toParent: self)
            addChild(vc)
            vc.didMove(toParent: self)
            contentScrollView.addSubview(contentView)
        }
        contentScrollView.contentSize = CGSize(width: CGFloat(iRange) * contentScrollView.frame.width, height: contentScrollView.frame.height)
    }
    
    private func updateContainerViewForPlayer(details: PlayerDetails) {
        let iRange = PlayerDetailsContent.allCases.count
        var x: CGFloat = 0
        for i in 0..<iRange {
            x = CGFloat(i) * contentScrollView.frame.width
            guard let vc = presenter?.getContentView(for: .player, at: i) else { return }
            let contentView = vc.view ?? UIView(frame: .zero)
            contentView.frame = CGRect(x: x, y: 0, width: contentScrollView.frame.width, height: contentScrollView.frame.height)
            vc.willMove(toParent: self)
            addChild(vc)
            vc.didMove(toParent: self)
            contentScrollView.addSubview(contentView)
        }
        contentScrollView.contentSize = CGSize(width: CGFloat(iRange) * contentScrollView.frame.width, height: contentScrollView.frame.height)
    }
    
    private func updateContainerViewForCaster() {
        let iRange = CasterDetailsContent.allCases.count
        var x: CGFloat = 0
        for i in 0..<iRange {
            x = CGFloat(i) * contentScrollView.frame.width
            guard let vc = presenter?.getContentView(for: .caster, at: i) else { return }
            let contentView = vc.view ?? UIView(frame: .zero)
            contentView.frame = CGRect(x: x, y: 0, width: contentScrollView.frame.width, height: contentScrollView.frame.height)
            vc.willMove(toParent: self)
            addChild(vc)
            vc.didMove(toParent: self)
            contentScrollView.addSubview(contentView)
        }
        contentScrollView.contentSize = CGSize(width: CGFloat(iRange) * contentScrollView.frame.width, height: contentScrollView.frame.height)
    }
    
    private func updateContainerViewForCreator() {
        var x: CGFloat = 0
        for i in 0..<CreatorDetailContent.allCases.count {
            x = CGFloat(i) * contentScrollView.frame.width
            guard let vc = presenter?.getContentView(for: .creator, at: i) else { return }
            let contentView = vc.view ?? UIView(frame: .zero)
            contentView.frame = CGRect(x: x, y: 0, width: contentScrollView.frame.width, height: contentScrollView.frame.height)
            vc.willMove(toParent: self)
            addChild(vc)
            vc.didMove(toParent: self)
            contentScrollView.addSubview(contentView)
        }
        contentScrollView.contentSize = CGSize(width: CGFloat(CreatorDetailContent.allCases.count) * contentScrollView.frame.width, height: contentScrollView.frame.height)
    }
    
    private func removeALLContentSubViews() {
        let subViews = contentScrollView.subviews
        subViews.forEach{ $0.removeFromSuperview() }
    }
    
    private func scrollToContentView(for index: Int) {
        let x = CGFloat(index) * contentScrollView.frame.width
        let y: CGFloat = 0
        contentScrollView.setContentOffset(CGPoint(x: x, y: y), animated: true)
    }

}



// MARK: - UICollectionView Protocol Conformance
extension Details: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getNumberOfContentCount() ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsContentCollectionViewCell.reuseIdentifier, for: indexPath) as? DetailsContentCollectionViewCell else { return UICollectionViewCell() }
        cell.set(title: presenter?.getContentTitle(for: indexPath.row) ?? "")
        if let selectedRow = collectionView.indexPathsForSelectedItems?.first {
            cell.set(isSelected: selectedRow == indexPath)
        } else {
            colletionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
            cell.set(isSelected: indexPath.row == 0)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DetailsContentCollectionViewCell else { return }
        cell.set(isSelected: true)
        scrollToContentView(for: indexPath.row)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DetailsContentCollectionViewCell else { return }
        cell.set(isSelected: false)
    }
}


// MARK: - UIScrollView Delegate Conformance.
extension Details: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index: Int = Int(scrollView.contentOffset.x / scrollView.frame.width)
        let indexPath: IndexPath = IndexPath(row: index, section: 0)
        if let lastSelectedIndexPath = colletionView.indexPathsForSelectedItems?.last {
            colletionView.deselectItem(at: lastSelectedIndexPath, animated: true)
            guard let cell = colletionView.cellForItem(at: lastSelectedIndexPath) as? DetailsContentCollectionViewCell else { return }
            cell.set(isSelected: false)
        }
        colletionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        guard let cell = colletionView.cellForItem(at: indexPath) as? DetailsContentCollectionViewCell else { return }
        cell.set(isSelected: true)
    }
}


// MARK: - View Delegate Protocol Conformance.
extension Details: DetailsViewDelegate {
    func renderDetails(details: TeamDetails) {
        removeALLContentSubViews()
        colletionView.reloadData()
        updateContainerView(details: details)
        coverImageView.kf.setImage(with: URL(string: details.detail.coverImageFullPath))
        teamImageView.kf.setImage(with: URL(string: details.detail.teamImageFullPath))
        teamNameLabel.text = details.detail.fullName
        locationImageView.kf.setImage(with: URL(string: details.detail.locationImageFullPath))
        cityNameLabel.text = details.detail.city
    }
    
    func renderPlayerDetails(details: PlayerDetails) {
        removeALLContentSubViews()
        colletionView.reloadData()
        updateContainerViewForPlayer(details: details)
        coverImageView.kf.setImage(with: URL(string: details.details.coverImageFullPath))
        teamImageView.kf.setImage(with: URL(string: details.details.playerImageFullPath))
        teamNameLabel.text = details.details.name
        locationImageView.kf.setImage(with: URL(string: details.details.locationImageFullPath))
        cityNameLabel.text = details.details.city
    }
    
    func renderCasterDetails(details: PlayerDetails) {
        removeALLContentSubViews()
        colletionView.reloadData()
        updateContainerViewForCaster()
        coverImageView.kf.setImage(with: URL(string: details.details.coverImageFullPath))
        teamImageView.kf.setImage(with: URL(string: details.details.playerImageFullPath))
        teamNameLabel.text = details.details.name
        locationImageView.kf.setImage(with: URL(string: details.details.locationImageFullPath))
        cityNameLabel.text = details.details.city
    }
    
    func renderCreatorDetails(details: PlayerDetails) {
        removeALLContentSubViews()
        colletionView.reloadData()
        updateContainerViewForCreator()
        coverImageView.kf.setImage(with: URL(string: details.details.coverImageFullPath))
        teamImageView.kf.setImage(with: URL(string: details.details.playerImageFullPath))
        teamNameLabel.text = details.details.name
        locationImageView.kf.setImage(with: URL(string: details.details.locationImageFullPath))
        cityNameLabel.text = details.details.city
    }
}


