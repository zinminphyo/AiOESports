//
//  Onboarding.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 21/03/2023.
//

import UIKit

class Onboarding: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    var viewModel: OnboardingViewModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    

}



// MARK: - View Hierarchy
extension Onboarding {
    private func configureHierarchy() {
        configureScrollView()
        configureContainerView()
        configureLogoImageView()
        configureCollectionView()
        configureTitleLabel()
        configureSubtitleLabel()
        configurePageControl()
        configureNextBtn()
    }
    
    private func configureScrollView() {
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = Colors.Theme.mainColor
        scrollView.delegate = self
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = Colors.Theme.mainColor
    }
    
    private func configureLogoImageView() {
        logoImageView.image = Images.logo
    }
    
    private func configureCollectionView() {
        collectionView.register(
            OnboardingImageCollectionCell.self,
            forCellWithReuseIdentifier: OnboardingImageCollectionCell.reuseIdentifier)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        collectionView.collectionViewLayout = flowLayout
        collectionView.dataSource = self
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Track your favourite game in one place"
        titleLabel.font = Fonts.titleFont
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.textColor = Colors.Text.primaryText
    }
    
    private func configureSubtitleLabel() {
        subtitleLabel.text = "We will show you all the necessary information of your favorite E-Sport game."
        subtitleLabel.font = Fonts.subtitleFont
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = Colors.Text.primaryText
    }
    
    private func configurePageControl() {
        pageControl.backgroundStyle = .minimal
        pageControl.numberOfPages = 3
        pageControl.tintColor = UIColor.gray
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
    }
    
    private func configureNextBtn() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            var container = AttributeContainer()
            container.foregroundColor = Colors.Text.primaryText
            configuration.attributedTitle = AttributedString("Next", attributes: container)
            nextBtn.configuration = configuration
        } else {
            nextBtn.setTitle("Next", for: .normal)
            
        }
        nextBtn.setTitleColor(Colors.Text.primaryText, for: .normal)
        nextBtn.backgroundColor = Colors.Button.secondaryColor
        nextBtn.layer.borderWidth = 0.3
        nextBtn.layer.borderColor = UIColor.white.cgColor
        nextBtn.layer.cornerRadius = 10 
        nextBtn.addTarget(self, action: #selector(didTapNextBtn(_:)), for: .touchUpInside)
    }
}


// MARK: - UICollectionView Protocol Conformance
extension Onboarding: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Images.Onboarding.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingImageCollectionCell.reuseIdentifier, for: indexPath) as? OnboardingImageCollectionCell else {
            return UICollectionViewCell()
        }
        cell.set(image: Images.Onboarding.allCases[indexPath.row].image)
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(index)
        viewModel?.set(currentPage: Int(index + 1))
    }
}


// MARK: - Onboarding View Protocol.
extension Onboarding: OnboardingViewProtocol {
    func didReachedLastPage(isReached: Bool) {
        UIView.animate(withDuration: 0.2, delay: 0.0) { [weak self] in
            guard let self = self else { return }
            self.nextBtn.backgroundColor = isReached ? Colors.Button.primaryColor : Colors.Button.secondaryColor
            self.nextBtn.layer.borderWidth = isReached ? 0.0 : 0.3
        }
    }
}


// MARK: - Actions.
extension Onboarding {
    @objc func didTapNextBtn(_ sender: UIButton) {
        print("Tapped Next Btn.")
    }
}
