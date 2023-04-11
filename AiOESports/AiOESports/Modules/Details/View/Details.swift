//
//  Details.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import UIKit

class Details: UIViewController {
    
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var colletionView: UICollectionView!
    
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
        configureCollectionView()
        configureContentScrollView()
    }
    
    private func configureContainerView() {
        self.view.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureContainerScrollView() {
        self.containerScrollView.showsVerticalScrollIndicator = false
        self.containerScrollView.showsHorizontalScrollIndicator = false
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
        colletionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    private func configureContentScrollView() {
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.showsVerticalScrollIndicator = false
        contentScrollView.isPagingEnabled = true
    }
    
    private func updateContainerView(details: TeamDetails) {
        let iRange = 0...3
        var x: CGFloat = 0
        for i in iRange {
            x = CGFloat(i) * contentScrollView.frame.width
            let vc = generateContentView(for: i, details: details)
            let contentView = vc.view ?? UIView(frame: .zero)
            contentView.frame = CGRect(x: x, y: 0, width: contentScrollView.frame.width, height: contentScrollView.frame.height)
            
            vc.willMove(toParent: self)
            addChild(vc)
            vc.didMove(toParent: self)
            contentScrollView.addSubview(contentView)
        }
        contentScrollView.contentSize = CGSize(width: CGFloat(iRange.count) * contentScrollView.frame.width, height: contentScrollView.frame.height)
    }
    
    private func generateContentView(for index: Int, details: TeamDetails) -> UIViewController {
        switch index {
        case 0:
            guard let vc = TeamOverviewModule.createModule(teamDetails: details.detail, social: details.social) else {return UIViewController()}
            return vc
        case 1:
            guard let vc = AchivementModule.createModule(achivementLists: details.achivemets) else { return UIViewController() }
            return vc
        case 2:
            guard let vc = FormerPlayersModule.createModule(formerPlayers: details.formerPlayers) else {return UIViewController()}
            return vc
        case 3:
            guard let vc = SponsorModule.createModule(sponsorLists: details.sponsors) else { return UIViewController() }
            return vc
        default:
            return UIViewController()
        }
    }
    
    private func scrollToContentView(for index: Int) {
        let x = CGFloat(index) * contentScrollView.frame.width
        let y: CGFloat = 0
        contentScrollView.setContentOffset(CGPoint(x: x, y: y), animated: true)
    }

}

extension Details: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TeamDetailsContent.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsContentCollectionViewCell.reuseIdentifier, for: indexPath) as? DetailsContentCollectionViewCell else { return UICollectionViewCell() }
        cell.set(title: TeamDetailsContent.allCases[indexPath.row].title)
            .set(isSelected: indexPath.row == 0)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DetailsContentCollectionViewCell else { return }
        cell.set(isSelected: true)
        scrollToContentView(for: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? DetailsContentCollectionViewCell else { return }
        cell.set(isSelected: false)
    }
}


extension Details: DetailsViewDelegate {
    func renderDetails(details: TeamDetails) {
        updateContainerView(details: details)
    }
}
