//
//  HomeViewDelegate.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 17/04/2023.
//

import Foundation


protocol HomeViewDelegate: ErrorPresentable {
    var presenter: HomePresenter? { get set }
    func renderUI(bannerLists: [BannerModel], adLists: [AdvertisementModel])
    func renderError(string: String)
}
