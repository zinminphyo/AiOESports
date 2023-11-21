//
//  Home.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/04/2023.
//

import UIKit

class Home: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var advertisementCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var advertisementTitleLabel: UILabel!
    
    var presenter: HomePresenting?
    
    private var bannerLists: [BannerModel] = []
    private var adLists: [AdvertisementModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
        
        presenter?.viewDidLoad()
    }
    
    private func configureHierarchy() {
        configureCollectionView()
        configureAdvertisementView()
    }
    
    private func configureCollectionView() {
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.itemSize = CGSize(width: collectionView.frame.width - 10, height: collectionView.frame.height)
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
    }
    
    private func configureAdvertisementView() {
        advertisementTitleLabel.font = Fonts.titleFont
        advertisementCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
        advertisementCollectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: advertisementCollectionView.frame.width * 0.8, height: advertisementCollectionView.frame.height)
        advertisementCollectionView.collectionViewLayout = flowLayout
        advertisementCollectionView.showsHorizontalScrollIndicator = false
        advertisementCollectionView.showsVerticalScrollIndicator = false
    }

}


extension Home: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == advertisementCollectionView {
            return adLists.count
        } else {
            return bannerLists.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        if collectionView == advertisementCollectionView {
            cell.set(url: adLists[indexPath.row].urlFullPath)
        } else {
            cell.set(url: bannerLists[indexPath.row].urlFullPath)
        }
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index: Int = Int(scrollView.contentOffset.x / scrollView.frame.width)
        self.pageControl.currentPage = index
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProfileController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension Home: HomeViewDelegate {
    func renderUI(bannerLists: [BannerModel], adLists: [AdvertisementModel]) {
        self.bannerLists = bannerLists
        self.collectionView.reloadData()
        self.adLists = adLists
        self.advertisementCollectionView.reloadData()
        self.pageControl.numberOfPages = bannerLists.count
    }
    
    func renderError(string: String) {
        showError(error: string)
    }
}
