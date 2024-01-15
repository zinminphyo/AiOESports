//
//  Details.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit
import Kingfisher
import Combine

class Details: UIViewController {
    
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var colletionView: UICollectionView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamInfoContainerView: UIView!
    @IBOutlet weak var locationCOntainerView: UIView!
    @IBOutlet weak var detailsInfoContainerView: UIView!
    @IBOutlet weak var loadingView: LoadingView!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var totalRatingLabel: UILabel!
    @IBOutlet weak var totalFollowerCountLabel: UILabel!
    @IBOutlet weak var totalVotedCountLabel: UILabel!
    @IBOutlet private(set) var followButton: UIButton!
    @IBOutlet private(set) var voteButton: UIButton!
    @IBOutlet private(set) var overlayView: UIView!
    
    @IBAction func didTapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var presenter: DetailsPresenter?
    
    var subscription = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.fetchDetails()
    }
    

    private func configureHierarchy() {
        configurePresenter()
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
//        voteButton.appliedGrandientColor()
    }
    
    private func configurePresenter() {
        presenter?.$isLoading
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                $0 ? self.loadingView.showLoading() : self.loadingView.hideLoading()
            }).store(in: &subscription)

        presenter?.$teamDetail
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self,
                      let detail = $0 else {
                    return
                }
                self.renderDetails(details: detail)
            }).store(in: &subscription)
        
        presenter?.$playerDetail
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self,
                let detail = $0 else {
                    return
                }
                self.renderPlayerDetails(details: detail)
            }).store(in: &subscription)
        
        presenter?.$isFollowing
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                let color = $0 ? Colors.Theme.mainColor : Colors.Theme.inputColor
                self.followButton.backgroundColor = color
                self.followButton.setTitle($0 ? "Following" : "Follow", for: .normal)
            }).store(in: &subscription)
        
        presenter?.$isVoting
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                $0 ? self.voteButton.appliedVotedBackground() : self.voteButton.appliedNotVotedBackground()
                self.voteButton.setTitle($0 ? "Voted" : "Vote", for: .normal)
                self.voteButton.isUserInteractionEnabled = !$0
            }).store(in: &subscription)
        
        presenter?.$casterDetail
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self,
                      let details = $0 else {
                    return
                }
                self.renderCasterDetails(details: details)
            }).store(in: &subscription)
        
        presenter?.$creatorDetail
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self,
                      let details = $0 else {
                    return
                }
                self.renderCreatorDetails(details: details)
            }).store(in: &subscription)
        
        
//        presenter?.fetchDetails()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.mainColor
        
    }
    
    private func configureContainerScrollView() {
        self.containerScrollView.showsVerticalScrollIndicator = false
        self.containerScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.backgroundColor = Colors.Theme.inputColor
    }
    
    private func configureCoverImageView() {
        coverImageView.contentMode = .scaleAspectFill
    }
    
    private func configureTeamInfoContainerView() {
//        teamInfoContainerView.backgroundColor = Colors.Theme.mainColor
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
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        colletionView.showsVerticalScrollIndicator = false
        colletionView.showsHorizontalScrollIndicator = false
        colletionView.collectionViewLayout = flowLayout
        colletionView.backgroundColor = Colors.Theme.inputColor
        colletionView.allowsMultipleSelection = false
        colletionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        
    }
    
    private func configureContentScrollView() {
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.showsVerticalScrollIndicator = false
        contentScrollView.isPagingEnabled = true
        contentScrollView.bounces = false
//        contentScrollView.backgroundColor = UIColor.clear
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
    
    
    @IBAction
    private func didTapRating(_ sender: UIButton) {
        let vc = CommentListsController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction
    private func didTapVote(_ sender: UIButton) {
        
        if UserDataModel.shared.getToken() == nil {
            guard let vc = LoginModule.createModule() else { return }
            navigationController?.pushViewController(vc, animated: true)
        } else {
            
            guard let userId = presenter?.id else { return }
            let voteInfo: VoteViewModel.VoteInfo
            switch presenter?.category {
            case .team:
                guard let details = presenter?.teamDetails else { return }
                voteInfo = .init(imageURL: details.detail.teamImageFullPath, name: details.detail.name, game: details.detail.game, rank: String(details.followRating.teamRank), location: details.detail.city, totalRatingStar: details.followRating.totalRatingStars , coverImageURL: details.detail.coverImageFullPath, id: String(details.detail.id), type: .team)
                
            case .player:
                guard let details = presenter?.playerDetails else { return }
                voteInfo = .init(imageURL: details.details.teamImageFullPath, name: details.details.name, game: details.details.game, rank: String("1"), location: details.details.city, totalRatingStar: String("5"), coverImageURL: details.details.coverImageFullPath, id: String(details.details.id), type: .talent)
                
            case .caster:
                guard let details = presenter?.casterDetails else { return }
                voteInfo = .init(imageURL: details.details.teamImageFullPath, name: details.details.name, game: details.details.game, rank: String("1"), location: details.details.city, totalRatingStar: String("5"), coverImageURL: details.details.coverImageFullPath, id: String(details.details.id), type: .talent)
                
            case .creator:
                guard let details = presenter?.creatorDetails else { return }
                voteInfo = .init(imageURL: details.details.teamImageFullPath, name: details.details.name, game: details.details.game, rank: String("1"), location: details.details.city, totalRatingStar: String("5"), coverImageURL: details.details.coverImageFullPath, id: String(details.details.id), type: .talent)
                
            default:
                voteInfo = .init(imageURL: "", name: "", game: "", rank: "", location: "", totalRatingStar: "", coverImageURL: "", id: "", type: .talent)
            }
            let vc = VoteController(userId: userId, voteInfo: voteInfo)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction
    private func didTapFollow(_ sender: UIButton) {
        if UserDataModel.shared.getToken() == nil {
            guard let vc = LoginModule.createModule() else { return }
            navigationController?.pushViewController(vc, animated: true)
        } else { presenter?.follow() }
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
        cell.set(isSelected: false)
        if let selectedRow = collectionView.indexPathsForSelectedItems?.last {
            cell.set(isSelected: indexPath == selectedRow)
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
        guard scrollView == contentScrollView else { return }
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
        configureCollectionView()
        updateContainerView(details: details)
        coverImageView.kf.setImage(with: URL(string: details.detail.coverImageFullPath), placeholder: Images.Placeholder.cover)
        teamImageView.kf.setImage(with: URL(string: details.detail.teamImageFullPath))
        teamNameLabel.text = details.detail.name
        gameNameLabel.text = details.detail.game.uppercased()
        gameImageView.image = Images.GameImages.getImage(gameName: details.detail.game)
        rankLabel.text = String(details.followRating.teamRank)
        totalRatingLabel.text = details.followRating.totalRatingStars
        totalFollowerCountLabel.text = "\(details.followRating.totalFollowers) \(details.followRating.totalRating > 1 ? "followers" : "follower")"
        totalVotedCountLabel.text = "\(details.followRating.totalRating) \(details.followRating.totalRating > 1 ? "votes" : "vote")"
        overlayView.isHidden = true
    }
    
    func renderPlayerDetails(details: PlayerDetails) {
        removeALLContentSubViews()
        configureCollectionView()
        updateContainerViewForPlayer(details: details)
        coverImageView.kf.setImage(with: URL(string: details.details.coverImageFullPath), placeholder: Images.Placeholder.cover)
        teamImageView.kf.setImage(with: URL(string: details.details.playerImageFullPath))
        teamNameLabel.text = details.details.name
        rankLabel.text = String(details.totalFollowRating.talentRank)
        gameImageView.image = Images.GameImages.getImage(gameName: details.details.game)
        gameNameLabel.text = details.details.game.uppercased()
        totalRatingLabel.text = details.totalFollowRating.totalRatingStars
        totalFollowerCountLabel.text = "\(details.totalFollowRating.totalFollowers) \(details.totalFollowRating.totalRating > 1 ? "followers" : "follower")"
        totalVotedCountLabel.text = "\(details.totalFollowRating.totalRating) \(details.totalFollowRating.totalRating > 1 ? "votes" : "vote")"
        overlayView.isHidden = true
    }
    
    func renderCasterDetails(details: CasterDetails) {
        removeALLContentSubViews()
        configureCollectionView()
        updateContainerViewForCaster()
        coverImageView.kf.setImage(with: URL(string: details.details.coverImageFullPath), placeholder: Images.Placeholder.cover)
        teamImageView.kf.setImage(with: URL(string: details.details.playerImageFullPath))
        gameImageView.image = Images.GameImages.getImage(gameName: details.details.game)
        gameNameLabel.text = details.details.game.uppercased()
        teamNameLabel.text = details.details.name
        rankLabel.text = String(details.totalFollowRating.talentRank)
        totalRatingLabel.text = details.totalFollowRating.totalRatingStars
        totalFollowerCountLabel.text = "\(details.totalFollowRating.totalFollowers) \(details.totalFollowRating.totalFollowers > 1 ? "followers" : "folower")"
        totalVotedCountLabel.text = "\(details.totalFollowRating.totalRating) \(details.totalFollowRating.totalRating > 1 ? "votes" : "vote")"
        overlayView.isHidden = true
    }
    
    func renderCreatorDetails(details: CasterDetails) {
        removeALLContentSubViews()
        configureCollectionView()
        updateContainerViewForCreator()
        coverImageView.kf.setImage(with: URL(string: details.details.coverImageFullPath), placeholder: Images.Placeholder.cover)
        teamImageView.kf.setImage(with: URL(string: details.details.playerImageFullPath))
        teamNameLabel.text = details.details.name
        gameImageView.image = Images.GameImages.getImage(gameName: details.details.game)
        gameNameLabel.text = details.details.game.uppercased()
        rankLabel.text = String(details.totalFollowRating.talentRank)
        totalRatingLabel.text = details.totalFollowRating.totalRatingStars
        totalFollowerCountLabel.text = "\(details.totalFollowRating.totalFollowers) \(details.totalFollowRating.totalFollowers > 1 ? "followers" : "folower")"
        totalVotedCountLabel.text = "\(details.totalFollowRating.totalRating) \(details.totalFollowRating.totalRating > 1 ? "votes" : "vote")"
        overlayView.isHidden = true
    }
}


