//
//  RankRouting.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 04/04/2023.
//

import Foundation
import UIKit

protocol RankRouting {
    var viewController: Rank? { get set }
    func routeToFilterSettings(category: RankCategory)
    func routeToSearch()
    func routeToDetails()
}
