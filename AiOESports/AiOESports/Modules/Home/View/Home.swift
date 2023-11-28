//
//  Home.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 02/04/2023.
//

import UIKit
import Combine

class Home: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var advertisementCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var advertisementTitleLabel: UILabel!
    @IBOutlet private(set) var loadingView: LoadingView!
    
    var presenter: HomePresenter?
    private(set) var subscription = Set<AnyCancellable>()
    
    private var bannerLists: [BannerModel] = []
    private var adLists: [AdvertisementModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureHierarchy()
        
        presenter?.viewDidLoad()
        presenter?.$isFetching
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                $0 ? self.loadingView.showLoading() : self.loadingView.hideLoading()
            }).store(in: &subscription)
        
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
        flowLayout.minimumLineSpacing = 8
        flowLayout.itemSize = CGSize(width: collectionView.frame.width - 8, height: collectionView.frame.height)
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
    
    
    @IBAction
    private func didTapMenu(_ sender: UIButton) {
        let vc = ProfileController()
        navigationController?.pushViewController(vc, animated: true)
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
        print("Content offset x is \(scrollView.contentOffset.x)")
        print("Width is \(scrollView.frame.width)")
        print("Index is \(index)")
//        self.pageControl.currentPage = index
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
