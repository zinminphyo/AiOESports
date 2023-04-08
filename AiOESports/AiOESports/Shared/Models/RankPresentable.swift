//
//  RankPresentable.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 08/04/2023.
//

import Foundation


protocol RankPresentable {
    func getImageURLPath() -> String
    func getName() -> String
    func getGameType() -> String
    func getLocation() -> String
}
