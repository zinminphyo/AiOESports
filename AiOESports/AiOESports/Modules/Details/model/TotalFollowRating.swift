//
//  TotalFollowRating.swift
//  AiOESports
//
//  Created by Zin Min Phyo on 03/12/2023.
//

import Foundation


struct TotalFollowRating: Decodable {
    let teamRank: Int
    let totalFollowers: Int
    let totalRating: Int
    let totalRatingStars: String
}
