//
//  PlayerOverviewPresenting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 13/04/2023.
//

import Foundation


protocol PlayerOverviewPresenting {
    var viewDelegate: PlayerOverviewViewDelegate? { get set }
    var router: PlayerOverviewRouting? { get set }
    func viewDidLoad()
    func getTitleForCell(at index: Int) -> String
    func getValueForCell(at index: Int) -> String
    func getImageURLForCell(at index: Int) -> String?
    func getSignatureLists() -> [SignatureModel]
    func didTapSocial(social: SocialModel)
}
