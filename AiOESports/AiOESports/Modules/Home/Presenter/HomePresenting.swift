//
//  HomePresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation


protocol HomePresenting {
    var viewDelegate: HomeViewDelegate? { get set }
    var interactor: HomeInteracting? { get set }
    func viewDidLoad()
    func didFinishedHomeDataFetching(bannerLists: [BannerModel]?, adLists: [AdvertisementModel]?, error: String?)
}
